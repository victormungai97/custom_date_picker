// lib/views/home/body.dart

part of 'home.dart';

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
              Text(
                Labels.title,
                style: Theme.of(context).textTheme.bodyText1,
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
                  initial: () => const SizedBox(height: 50),
                  load: () => const Center(
                    child: Center(child: CircularProgressIndicator()),
                  ),
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
                  initial: () => const SizedBox(height: 50),
                  load: () => const Center(
                    child: Center(child: CircularProgressIndicator()),
                  ),
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
                  initial: () => const SizedBox(height: 50),
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

  void _openCalendar(BuildContext context, Variant variant) {
    context.read<VariantsCubit>().determineVariant(variant);
    switch (variant) {
      case Variant.none:
        break;
      case Variant.preset_0:
        final state = context.read<Preset0Bloc>().state;
        if (state is Preset0SetSuccess) {
          context.read<SelectedDayCubit>().updateDay(
                DateFormat('d MMM yyyy').parse(state.date),
              );
        }
        break;
      case Variant.preset_4:
        final state = context.read<Preset4Bloc>().state;
        if (state is Preset4SetSuccess) {
          context.read<SelectedDayCubit>().updateDay(
                DateFormat('d MMM yyyy').parse(state.date),
              );
        }
        break;
      case Variant.preset_6:
        final state = context.read<Preset6Bloc>().state;
        if (state is Preset6SetSuccess) {
          context.read<SelectedDayCubit>().updateDay(
                DateFormat('d MMM yyyy').parse(state.date),
              );
        }
        break;
    }
    context.read<PresetsCubit>().setPresets(variant);
    showDialog<void>(
      context: context,
      builder: (_) => const CalendarDialog(),
      barrierDismissible: !kDebugMode,
    ).then((value) => context.read<SelectedDayCubit>().reset());
  }
}
