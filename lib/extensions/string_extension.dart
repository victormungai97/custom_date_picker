// lib/extensions/string_extension.dart

/// Extension to ``[String]`` class to provide miscellaneous functionalities

extension StringExtensions on String? {
  /// Checks that the given string is not null and is not empty
  bool get exists => this != null && this!.isNotEmpty;
}
