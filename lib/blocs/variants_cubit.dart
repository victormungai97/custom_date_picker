// lib/blocs/variants_cubit.dart

import 'package:bloc/bloc.dart';

import 'package:custom_date_picker/constants/constants.dart';

/// Cubit to detect preset variant to use when picking date from calendar
/// based on user's choice
class VariantsCubit extends Cubit<Variant> {
  /// Constructor for ``[VariantsCubit]``
  VariantsCubit() : super(Variant.none);

  /// Set preset variant here
  void determineVariant(Variant variant) => emit(variant);
}
