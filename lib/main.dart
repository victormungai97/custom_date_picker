// lib/main.dart

import 'package:custom_date_picker/blocs/blocs.dart';
import 'package:custom_date_picker/navigation/navigation.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
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

  runApp(MyApp());
}

/// Root widget
class MyApp extends StatelessWidget {
  ///
  MyApp({super.key});

  final _router = AppRouter().router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VariantsCubit>(create: (_) => VariantsCubit()),
        BlocProvider<Preset0Bloc>(create: (_) => Preset0Bloc()),
        BlocProvider<Preset4Bloc>(create: (_) => Preset4Bloc()),
        BlocProvider<Preset6Bloc>(create: (_) => Preset6Bloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}
