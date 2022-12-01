// lib/blocs/preset4/preset4_event.dart

part of 'preset4_bloc.dart';

/// Base class for events for 4-preset date picking

@freezed
class Preset4Event with _$Preset4Event {
  /// Initial event
  const factory Preset4Event.initial() = _Preset4EventStarted;

  /// Event to set a 4-preset based date
  const factory Preset4Event.set({required String pickedDate}) =
      _Preset4EventSet;

  /// Event to remove a 4-preset based date
  const factory Preset4Event.remove() = _Preset4EventRemoved;
}
