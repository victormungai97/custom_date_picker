// lib/views/home/components/presets.dart

import 'package:custom_date_picker/constants/constants.dart';
import 'package:custom_date_picker/cubits/cubits.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quiver/iterables.dart';

/// Widget to represent the various preset options

class PresetsWidget extends HookWidget {
  /// Constructor for ``[PresetsWidget]``
  const PresetsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final presets = context.watch<PresetsCubit>().state;
    // Split a list into small portions
    final partitions = presets != null && presets.isNotEmpty
        ? partition<Map<String, num>>(presets, 2).toList(growable: false)
        : <String>[];
    final width = MediaQuery.of(context).size.width;

    final highlightedButton = useState<String?>(null);

    return SingleChildScrollView(
      child: Column(
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
                              context.read<SelectedDayCubit>().updateDay(DateTime.now().add(
                                Duration(days: interval)
                              ),);
                              highlightedButton.value = e.keys.first;
                            },
                            child: Text(
                              e.keys.first,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
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
        ],
      ),
    );
  }
}
