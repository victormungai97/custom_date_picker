// lib/navigation/router.dart

part of 'navigation.dart';

/// Custom class for Navigation

class AppRouter {
  /// Instance of `GoRouter` which facilitates navigation in this Flutter app
  /// by implementing Navigation API 2.0

  late final router = GoRouter(
    // Show debugging logs if app is in debug.
    debugLogDiagnostics: true,
    // Set all routes to be used
    routes: <GoRoute>[
      GoRoute(
        path: Routes.root,
        builder: (context, GoRouterState state) => const HomePage(
          key: ValueKey(WidgetKeys.homePage),
        ),
      ),
    ],
    // Declare first route to be rendered when app starts
    initialLocation: Routes.root,
  );
}
