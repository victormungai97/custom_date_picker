// lib/views/home/components/bottom_row.dart

import 'package:custom_date_picker/constants/constants.dart';
import 'package:custom_date_picker/cubits/cubits.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Layout of the bottom row on the calendar UI

class CalendarBottomRow extends StatelessWidget {
  /// Constructor for ``[CalendarBottomRow]``
  const CalendarBottomRow({
    super.key,
    required this.onSuccessfulPicking,
  });

  /// Function to run on successful picking of date
  final void Function(BuildContext) onSuccessfulPicking;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.date_range, color: AppColors.iconColor, size: 28),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: BlocBuilder<SelectedDayCubit, String?>(
              builder: (_, String? state) {
                return Text(
                  state ?? Messages.selectedDateMissing,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12.5),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                maximumSize: const Size(73, 40),
                backgroundColor: AppColors.bgColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                foregroundColor: AppColors.logoColor,
              ),
              onPressed: Navigator.of(context).pop,
              child: const Text(
                Labels.cancel,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                maximumSize: const Size(73, 40),
              ),
              onPressed: () => onSuccessfulPicking(context),
              child: const Text(
                Labels.save,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
