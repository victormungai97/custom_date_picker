// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:custom_date_picker/constants/constants.dart';
import 'package:custom_date_picker/keys/keys.dart';
import 'package:custom_date_picker/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path/path.dart' as path;

void main() {
  group('E2E', () {
    late Storage storage;

    setUp(() async {
      storage = await HydratedStorage.build(
        storageDirectory: Directory(
          path.join(Directory.current.path, '.cache'),
        ),
      );
      HydratedBloc.storage = storage;
    });

    tearDown(() async {
      try {
        await storage.clear();
        Directory(
          path.join(Directory.current.path, '.cache'),
        ).deleteSync(recursive: true);
        await HydratedStorage.hive.deleteFromDisk();
      } catch (_) {debugPrint('$_');}
    });

    testWidgets('Application smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      expect(find.byKey(const ValueKey(WidgetKeys.homePage)), findsOneWidget);
      expect(find.text(Labels.title), findsOneWidget);
    });

  });
}
