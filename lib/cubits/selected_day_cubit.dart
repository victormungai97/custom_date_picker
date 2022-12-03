// lib/cubits/selected_day_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

/// Cubit to update a selected day in calendar regardless of presets
class SelectedDayCubit extends Cubit<String?> {
  /// Constructor for ``[SelectedDayCubit]``
  SelectedDayCubit() : super(DateFormat('d MMM yyyy').format(DateTime.now()));

  /// Set picked day here
  void updateDay(DateTime? day) => emit(
        DateFormat('d MMM yyyy').format(day ?? DateTime.now()),
      );

  /// Reset picked day
  void reset() => emit(DateFormat('d MMM yyyy').format(DateTime.now()));
}
