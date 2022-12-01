// lib/blocs/preset0/preset0_bloc.dart

import 'package:custom_date_picker/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'preset0_bloc.freezed.dart';
part 'preset0_event.dart';
part 'preset0_state.dart';

/// Bloc for use with calendar with no preset
class Preset0Bloc extends HydratedBloc<Preset0Event, Preset0State> {
  /// Constructor for ``[Preset0Bloc]``
  Preset0Bloc() : super(const Preset0Initial()) {
    on<Preset0Event>((event, emit) {
      event.whenOrNull(
        set: (date) async {
          // Mark as in progress
          emit(const Preset0State.load());
          // Save picked date
          emit(Preset0State.set(date: date));
        },
        remove: () async {
          // Mark as in progress
          emit(const Preset0State.load());
          // Delete picked date
          emit(const Preset0State.initial());
        },
      );
    });
  }

  @override
  Preset0State? fromJson(Map<String, dynamic>? json) {
    if (json == null || json.isEmpty) return const Preset0State.initial();
    return Preset0State.set(date: json[Labels.presets_0] as String);
  }

  @override
  Map<String, dynamic>? toJson(Preset0State? state) {
    if (state == null || state is! Preset0SetSuccess) return {};
    return {Labels.presets_0: state.date};
  }
}
