import 'package:clean_architecture/features/Intro/presentation/pages/onboarding_page.dart';
import 'package:clean_architecture/features/Intro/presentation/pages/splash_page.dart';
import 'package:clean_architecture/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'onboarding_page',
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingPage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/login_page',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
  ],
);
