// lib/blocs/preset6/preset6_bloc.dart

import 'package:custom_date_picker/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'preset6_bloc.freezed.dart';
part 'preset6_event.dart';
part 'preset6_state.dart';

/// Bloc for use with calendar with 6 preset
class Preset6Bloc extends HydratedBloc<Preset6Event, Preset6State> {
  /// Constructor for ``[Preset6Bloc]``
  Preset6Bloc() : super(const Preset6Initial()) {
    on<Preset6Event>((event, emit) {
      event.whenOrNull(
        set: (date) async {
          // Mark as in progress
          emit(const Preset6State.load());
          // Save picked date
          emit(Preset6State.set(date: date));
        },
        remove: () async {
          // Mark as in progress
          emit(const Preset6State.load());
          // Delete picked date
          emit(const Preset6State.initial());
        },
      );
    });
  }

  @override
  Preset6State? fromJson(Map<String, dynamic>? json) {
    if (json == null || json.isEmpty) return const Preset6State.initial();
    return Preset6State.set(date: json[Labels.presets_6] as String);
  }

  @override
  Map<String, dynamic>? toJson(Preset6State? state) {
    if (state == null || state is! Preset6SetSuccess) return {};
    return {Labels.presets_6: state.date};
  }
}
