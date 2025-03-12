import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/feature/splash/splash_screen.dart';

import '../feature/main/main_page.dart';

/// The route configuration.
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'main',
          builder: (BuildContext context, GoRouterState state) {
            return const MainPage();
          },
        ),
      ],
    ),
  ],
);