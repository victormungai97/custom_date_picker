// lib/views/home/components/result.dart

import 'package:custom_date_picker/blocs/blocs.dart';
import 'package:custom_date_picker/constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Widget to show a selected date
class ResultWidget extends StatelessWidget {
  /// Constructor for ``[ResultWidget]``
  const ResultWidget({super.key, required this.selectedDate, required this.variant,});

  /// Selected Date
  final String selectedDate;

  /// Preset option provided
  final Variant variant;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 198.6,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(68)),
        color: AppColors.bgColor,
      ),
      child: Center(
        child: Row(
          children: [
            const Expanded(child: Icon(Icons.date_range, color: AppColors.logoColor, size: 18,),),
            Expanded(flex: 2, child: Center(child: Text(selectedDate, style: const TextStyle(color: AppColors.logoColor, fontSize: 16),),), ),
            Expanded(child: IconButton(onPressed: () => _delete(context), icon: const Icon(Icons.close_sharp, color: AppColors.logoColor, size: 18,),),),
          ],
        ),
      ),
    );
  }

  void _delete(BuildContext context) {
    switch (variant) {

      case Variant.none:
        return;
      case Variant.preset_0:
        context.read<Preset0Bloc>().add(const Preset0Event.remove());
        return;
      case Variant.preset_4:
        context.read<Preset4Bloc>().add(const Preset4Event.remove());
        return;
      case Variant.preset_6:
        context.read<Preset6Bloc>().add(const Preset6Event.remove());
        return;
    }
  }
}
