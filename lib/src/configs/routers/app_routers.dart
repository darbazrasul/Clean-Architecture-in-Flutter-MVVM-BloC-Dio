import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clean_architecture_in_flutter/src/configs/routers/app_routes.dart';
import 'package:clean_architecture_in_flutter/src/configs/routers/error_page.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: AppRoutes.splashView,
    errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
    routes: <RouteBase>[
      // GoRoute(
      //   path: AppRoutes.splashView,
      //   name: AppRoutes.splashView,
      //   builder: (context, state) => const SplashScreen(),
      // ),
    ],
  );
}
