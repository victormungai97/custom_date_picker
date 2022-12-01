// lib/views/home/body.dart

part of 'home.dart';

//ignore: must_be_immutable
class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    final preset0State = context.watch<Preset0Bloc>().state;
    final preset4State = context.watch<Preset4Bloc>().state;
    final preset6State = context.watch<Preset6Bloc>().state;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                Labels.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 25),
              HomeButton(
                text: Labels.presets_0,
                key: WidgetKeys.presets_0,
                onTap: () => _openCalendar(context, Variant.preset_0),
              ),
              const SizedBox(height: 12.5),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: preset0State.whenOrNull(
                  initial: SizedBox.shrink,
                  load: () => const Center(
                      child: Center(child: CircularProgressIndicator())),
                  set: (selectedDate) => ResultWidget(
                    selectedDate: selectedDate,
                    variant: Variant.preset_0,
                  ),
                ),
              ),
              const SizedBox(height: 12.5),
              HomeButton(
                text: Labels.presets_4,
                key: WidgetKeys.presets_4,
                onTap: () => _openCalendar(context, Variant.preset_4),
              ),
              const SizedBox(height: 12.5),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: preset4State.whenOrNull(
                  initial: SizedBox.shrink,
                  load: () => const Center(
                      child: Center(child: CircularProgressIndicator())),
                  set: (selectedDate) => ResultWidget(
                    selectedDate: selectedDate,
                    variant: Variant.preset_4,
                  ),
                ),
              ),
              const SizedBox(height: 12.5),
              HomeButton(
                text: Labels.presets_6,
                key: WidgetKeys.presets_6,
                onTap: () => _openCalendar(context, Variant.preset_6),
              ),
              const SizedBox(height: 12.5),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: preset6State.whenOrNull(
                  initial: SizedBox.shrink,
                  load: () => const Center(child: CircularProgressIndicator()),
                  set: (selectedDate) => ResultWidget(
                    selectedDate: selectedDate,
                    variant: Variant.preset_6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _getDifferenceBtnDays(String source, String target) {
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

    final difference = current! - dst!;
    if (difference > 0) return difference;
    return 7 + difference;
  }

  void _openCalendar(BuildContext context, Variant variant) {
    final today = DateFormat('EEEE').format(DateTime.now());
    context.read<VariantsCubit>().determineVariant(variant);
    final presets = <Map<String, int>>[];
    switch (variant) {
      case Variant.none:
      case Variant.preset_0:
        break;
      case Variant.preset_4:
        presets.addAll(<Map<String, int>>[
          {Labels.unEnding: 0},
          {Labels.after_15: 15},
          {Labels.after_30: 30},
          {Labels.after_60: 60},
        ]);
        break;
      case Variant.preset_6:
        presets.addAll(<Map<String, int>>[
          {Labels.yesterday: -1},
          {Labels.today: 0},
          {Labels.tomorrow: 1},
          {Labels.saturday: _getDifferenceBtnDays(today, 'Saturday')},
          {Labels.sunday: _getDifferenceBtnDays(today, 'Sunday')},
          {Labels.tuesday: _getDifferenceBtnDays(today, 'Tuesday')},
        ]);
        break;
    }
    showDialog<void>(
      context: context,
      builder: (_) => CalendarDialog(
        presets: presets,
      ),
    );
  }
}
