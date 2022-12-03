// lib/main.dart

import 'package:custom_date_picker/blocs/blocs.dart';
import 'package:custom_date_picker/constants/constants.dart';
import 'package:custom_date_picker/cubits/cubits.dart';
import 'package:custom_date_picker/keys/keys.dart';
import 'package:custom_date_picker/views/views.dart' show HomePage;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set up to start up bloc
  Bloc.observer = SimpleBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  runApp(const MyApp());
}

/// Root widget
class MyApp extends StatelessWidget {
  ///
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<Preset0Bloc>(create: (_) => Preset0Bloc()),
        BlocProvider<Preset4Bloc>(create: (_) => Preset4Bloc()),
        BlocProvider<Preset6Bloc>(create: (_) => Preset6Bloc()),
        BlocProvider<PresetsCubit>(create: (_) => PresetsCubit()),
        BlocProvider<SelectedDayCubit>(create: (_) => SelectedDayCubit()),
        BlocProvider<VariantsCubit>(create: (_) => VariantsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.appTheme,
        title: Labels.appName,
        home: const HomePage(key: ValueKey(WidgetKeys.homePage)),
      ),
    );
  }
}
