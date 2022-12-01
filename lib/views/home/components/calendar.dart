// lib/views/home/components/calendar.dart

import 'package:custom_date_picker/blocs/blocs.dart';
import 'package:custom_date_picker/constants/constants.dart';
import 'package:custom_date_picker/extensions/extensions.dart';
import 'package:custom_date_picker/views/home/components/components.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:quiver/iterables.dart';
import 'package:table_calendar/table_calendar.dart';

/// Widget to hold the calendar for date picking
class CalendarDialog extends HookWidget {
  /// Constructor for ``[CalendarDialog]``
  const CalendarDialog({super.key, this.presets});

  /// Provided presets
  final List<Map<String, int>>? presets;

  @override
  Widget build(BuildContext context) {
    final calendarFormat = useState<CalendarFormat>(CalendarFormat.month);
    final focusedDay = useState<DateTime>(DateTime.now());
    final selectedDay = useState<DateTime?>(null);
    final now = DateTime.now();

    // Split a list into small portions
    final partitions = presets != null && presets!.isNotEmpty
        ? partition<Map<String, num>>(presets!, 2).toList(growable: false)
        : <String>[];
    final width = MediaQuery.of(context).size.width;

    final highlightedButton = useState<String?>(null);

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: SizedBox(
        height: 498 + (partitions.isNotEmpty ? partitions.length + 50 : 0),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (partitions.isNotEmpty)
                  ...partitions.map(
                    (l) => SizedBox(
                      width: width,
                      child: Row(
                        children: (l as List).map(
                          (el) {
                            final e = el as Map<String, int>;
                            final selected =
                                highlightedButton.value == e.keys.first;
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    fixedSize: const Size(174, 40),
                                    backgroundColor: !selected
                                        ? AppColors.bgColor
                                        : AppColors.logoColor,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    foregroundColor: selected
                                        ? AppColors.textColor
                                        : AppColors.logoColor,
                                  ),
                                  onPressed: () {
                                    final interval = e.values.first;
                                    selectedDay.value = now.add(
                                      Duration(days: interval),
                                    );
                                    highlightedButton.value = e.keys.first;
                                  },
                                  child: Text(
                                    e.keys.first,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                TableCalendar<dynamic>(
                  calendarBuilders: CalendarBuilders(
                    selectedBuilder: (_, DateTime date, DateTime focusedDay) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.all(9.5),
                          decoration: const BoxDecoration(
                            color: AppColors.logoColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                    todayBuilder: (_, DateTime date, DateTime focusedDay) {
                      return Center(
                        child: Text(
                          date.day.toString(),
                          style: const TextStyle(color: AppColors.logoColor),
                        ),
                      );
                    },
                  ),
                  firstDay: DateTime.utc(1970),
                  lastDay: DateTime.utc(2100, 12, 31),
                  calendarFormat: calendarFormat.value,
                  selectedDayPredicate: (_) => isSameDay(selectedDay.value, _),
                  onDaySelected: (selected, focused) {
                    focusedDay.value = focused;
                    selectedDay.value = selected;
                  },
                  onPageChanged: (focused) {
                    // No need to call `setState()` here
                    focusedDay.value = focused;
                  },
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  focusedDay: focusedDay.value,
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                  },
                  onFormatChanged: (value) => calendarFormat.value = value,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: width < 576
                      ? CalendarButtonsSmall(
                          selectedDay: selectedDay.value != null
                              ? DateFormat('d MMM yyyy')
                                  .format(selectedDay.value!)
                              : null,
                          onSuccessfulPicking: _onDatePicked,
                        )
                      : CalendarButtonsLarge(
                          selectedDay: selectedDay.value != null
                              ? DateFormat('d MMM yyyy')
                                  .format(selectedDay.value!)
                              : null,
                          onSuccessfulPicking: _onDatePicked,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onDatePicked(BuildContext context, String? selectedDay) {
    if (!selectedDay.exists) {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: ListTile(
            title: Text(
              Messages.selectedDateMissing,
              style: TextStyle(color: Colors.pink.shade300),
            ),
          ),
          action: SnackBarAction(
            label: Labels.close,
            onPressed: scaffoldMessenger.hideCurrentSnackBar,
          ),
          dismissDirection: DismissDirection.vertical,
        ),
      );
      return;
    }
    final day = selectedDay!;
    switch (context.read<VariantsCubit>().state) {
      case Variant.preset_0:
        context.read<Preset0Bloc>().add(Preset0Event.set(pickedDate: day));
        break;
      case Variant.preset_4:
        context.read<Preset4Bloc>().add(Preset4Event.set(pickedDate: day));
        break;
      case Variant.preset_6:
        context.read<Preset6Bloc>().add(Preset6Event.set(pickedDate: day));
        break;
      case Variant.none:
        break;
    }
    Navigator.of(context).pop();
  }
}
