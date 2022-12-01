// lib/blocs/preset6/preset6_state.dart

part of 'preset6_bloc.dart';

/// Base class for multiple workout states

@freezed
class Preset6State with _$Preset6State {
  /// Initial state for date
  const factory Preset6State.initial() = Preset6Initial;

  /// Updating date
  const factory Preset6State.load() = Preset6Loading;

  /// Date saved
  const factory Preset6State.set(
      {required String date}) = Preset6SetSuccess;
}
