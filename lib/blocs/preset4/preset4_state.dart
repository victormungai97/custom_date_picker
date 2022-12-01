// lib/blocs/preset4/preset4_state.dart

part of 'preset4_bloc.dart';

/// Base class for multiple workout states

@freezed
class Preset4State with _$Preset4State {
  /// Initial state for date
  const factory Preset4State.initial() = Preset4Initial;

  /// Updating date
  const factory Preset4State.load() = Preset4Loading;

  /// Date saved
  const factory Preset4State.set(
      {required String date}) = Preset4SetSuccess;
}
