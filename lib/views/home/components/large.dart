// lib/views/home/components/large.dart

import 'package:custom_date_picker/constants/constants.dart';
import 'package:custom_date_picker/extensions/extensions.dart';

import 'package:flutter/material.dart';

/// Layout of calendar buttons on large width devices

class CalendarButtonsLarge extends StatelessWidget {
  /// Constructor for ``[CalendarButtonsLarge]``
  const CalendarButtonsLarge({
    super.key,
    required this.selectedDay,
    required this.onSuccessfulPicking,
  });

  /// Date picked from calendar
  final String? selectedDay;

  /// Function to run on successful picking of date
  final void Function(BuildContext, String?) onSuccessfulPicking;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ListTile(
            leading: const Icon(Icons.date_range, color: AppColors.iconColor),
            title: Text(
              selectedDay.exists ? selectedDay! : Messages.selectedDateMissing,
            ),
          ),
        ),
        if (selectedDay.exists)
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: const Size(73, 40),
                      backgroundColor: AppColors.bgColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      foregroundColor: AppColors.logoColor,
                    ),
                    onPressed: Navigator.of(context).pop,
                    child: const Text(Labels.cancel),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: const Size(73, 40),
                    ),
                    onPressed: () => onSuccessfulPicking(context, selectedDay),
                    child: const Text(Labels.save),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
