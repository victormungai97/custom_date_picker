import 'package:bloc/bloc.dart';
import 'package:custom_date_picker/constants/constants.dart';
import 'package:intl/intl.dart';

/// Cubit to provide a collection of preset options
class PresetsCubit extends Cubit<List<Map<String, int>>?> {
  /// Constructor for ``[PresetsCubit]``
  PresetsCubit() : super(null);

  final _presets4 = <Map<String, int>>[
    {Labels.unEnding: 0},
    {Labels.after_15: 15},
    {Labels.after_30: 30},
    {Labels.after_60: 60},
  ];

  List<Map<String, int>> _presets6(String today) => <Map<String, int>>[
    {Labels.yesterday: -1},
    {Labels.today: 0},
    {Labels.tomorrow: 1},
    {Labels.saturday: _getDifferenceBtnDays(today, 'Saturday')},
    {Labels.sunday: _getDifferenceBtnDays(today, 'Sunday')},
    {Labels.tuesday: _getDifferenceBtnDays(today, 'Tuesday')},
  ];

  /// Set preset options
  void setPresets(Variant variant) {
    switch (variant) {

      case Variant.none:
      case Variant.preset_0:
        emit(null);
        return;
      case Variant.preset_4:
        emit(_presets4);
        return;
      case Variant.preset_6:
        emit(_presets6(DateFormat('EEEE').format(DateTime.now())));
        return;
    }
  }

  static int _getDifferenceBtnDays(String source, String target) {
    final daysOfWeek = {
      'Monday': 1,
      'Tuesday': 2,
      'Wednesday': 3,
      'Thursday': 4,
      'Friday': 5,
      'Saturday': 6,
      'Sunday': 7,
    };

    final current = daysOfWeek.containsKey(source) ? daysOfWeek[source] : 0;
    final dst = daysOfWeek.containsKey(target) ? daysOfWeek[target] : 0;

    final difference = dst! - current!;
    if (difference >= 0) return difference;
    return 7 + difference;
  }
}
