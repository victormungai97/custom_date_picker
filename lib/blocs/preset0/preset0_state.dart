// lib/blocs/preset0/preset0_state.dart

part of 'preset0_bloc.dart';

/// Base class for multiple workout states

@freezed
class Preset0State with _$Preset0State {
  /// Initial state for workouts
  const factory Preset0State.initial() = Preset0Initial;

  /// Receiving recorded workouts
  const factory Preset0State.load() = Preset0Loading;

  /// Workouts obtained
  const factory Preset0State.set({required String date}) = Preset0SetSuccess;
}
