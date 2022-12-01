// lib/blocs/preset0/preset0_event.dart

part of 'preset0_bloc.dart';

/// Base class for events for no-preset date picking

@freezed
class Preset0Event with _$Preset0Event {
  /// Initial event
  const factory Preset0Event.initial() = _Preset0Started;

  /// Event to set a no preset based date
  const factory Preset0Event.set({required String pickedDate}) =
  _Preset0EventSet;

  /// Event to remove a no preset based date
  const factory Preset0Event.remove() =
  _Preset0EventRemoved;

}