// lib/blocs/preset6/preset6_event.dart

part of 'preset6_bloc.dart';

/// Base class for events for 6-preset date picking

@freezed
class Preset6Event with _$Preset6Event {
  /// Initial event
  const factory Preset6Event.initial() = _Preset6EventStarted;

  /// Event to set a 6-preset based date
  const factory Preset6Event.set({required String pickedDate}) =
      _Preset6EventSet;

  /// Event to remove a 6-preset based date
  const factory Preset6Event.remove() = _Preset6EventRemoved;
}
