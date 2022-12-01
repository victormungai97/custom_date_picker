// lib/blocs/preset4/preset4_bloc.dart

import 'package:custom_date_picker/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'preset4_bloc.freezed.dart';
part 'preset4_event.dart';
part 'preset4_state.dart';

/// Bloc for use with calendar with 4 preset
class Preset4Bloc extends HydratedBloc<Preset4Event, Preset4State> {
  /// Constructor for ``[Preset4Bloc]``
  Preset4Bloc() : super(const Preset4Initial()) {
    on<Preset4Event>((event, emit) {
      event.whenOrNull(
        set: (date) async {
          // Mark as in progress
          emit(const Preset4State.load());
          // Save picked date
          emit(Preset4State.set(date: date));
        },
        remove: () async {
          // Mark as in progress
          emit(const Preset4State.load());
          // Delete picked date
          emit(const Preset4State.initial());
        },
      );
    });
  }

  @override
  Preset4State? fromJson(Map<String, dynamic>? json) {
    if (json == null || json.isEmpty) return const Preset4State.initial();
    return Preset4State.set(date: json[Labels.presets_4] as String);
  }

  @override
  Map<String, dynamic>? toJson(Preset4State? state) {
    if (state == null || state is! Preset4SetSuccess) return {};
    return {Labels.presets_4: state.date};
  }
}
