// lib/views/home/components/calendar.dart

import 'package:custom_date_picker/blocs/blocs.dart';
import 'package:custom_date_picker/constants/constants.dart';
import 'package:custom_date_picker/cubits/cubits.dart';
import 'package:custom_date_picker/extensions/extensions.dart';
import 'package:custom_date_picker/views/home/components/components.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

/// Widget to hold the calendar for date picking
class CalendarDialog extends HookWidget {
  /// Constructor for ``[CalendarDialog]``
  const CalendarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final focusedDay = useState<DateTime>(DateTime.now());
    final cubit = context.watch<SelectedDayCubit>();
    final scrollController = useScrollController();
    final presets = context.watch<PresetsCubit>().state;

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: SafeArea(
        child: Container(
          height: presets != null && presets.isNotEmpty
              ? presets.length <= 4
                  ? 570
                  : 630
              : 435,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (presets != null && presets.isNotEmpty)
                Expanded(
                  flex: presets.length <= 4 ? 2 : 3,
                  child: const PresetsWidget(),
                ),
              Expanded(
                flex: (presets?.length ?? 0) <= 4 ? 5 : 6,
                child: Scrollbar(
                  controller: scrollController,
                  thumbVisibility: true,
                  radius: const Radius.circular(50),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: TableCalendar<dynamic>(
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                        leftChevronIcon: const Icon(Icons.arrow_left),
                        leftChevronMargin: const EdgeInsets.only(left: 8),
                        leftChevronPadding: EdgeInsets.zero,
                        rightChevronIcon: const Icon(Icons.arrow_right),
                        rightChevronMargin: const EdgeInsets.only(right: 8),
                        rightChevronPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        titleTextStyle: Theme.of(context).textTheme.bodyText1!,
                      ),
                      calendarBuilders: CalendarBuilders(
                        selectedBuilder:
                            (_, DateTime date, DateTime focusedDay) {
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
                              style:
                                  const TextStyle(color: AppColors.logoColor),
                            ),
                          );
                        },
                      ),
                      firstDay: DateTime.utc(1970),
                      lastDay: DateTime.utc(2100, 12, 31),
                      selectedDayPredicate: (day) => isSameDay(
                        DateFormat('d MMM yyyy').parse(cubit.state!),
                        day,
                      ),
                      onDaySelected: (selected, focused) {
                        // focusedDay.value = focused;
                        cubit.updateDay(selected);
                      },
                      onPageChanged: (focused) {
                        // No need to call `setState()` here
                        focusedDay.value = focused;
                      },
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      focusedDay: focusedDay.value,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CalendarBottomRow(onSuccessfulPicking: _onDatePicked),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDatePicked(BuildContext context) {
    final selectedDay = context.read<SelectedDayCubit>().state;
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
