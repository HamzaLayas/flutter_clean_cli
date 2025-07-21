import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

import 'route_constants.dart';
import '../configs/dependency_injection.dart';

class AppRouter {
  static final GetIt _sl = GetIt.instance;

  static final GoRouter routes = GoRouter(
    initialLocation: RouteConstants.kSplash,
    errorBuilder: (context, state) {
      return const PageNotFound();
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) => CustomOfflineBuilder(child: child),
        routes: [
          GoRoute(
            path: RouteConstants.kSplash,
            builder: (context, state) => BlocProvider(
              create: (_) => _sl<AuthCubit>(),
              child: SplashView(),
            ),
          ),
          GoRoute(
            path: RouteConstants.kOnBoarding,
            builder: (context, state) => BlocProvider(
              create: (_) => OnboardingCubit(),
              child: OnboardingView(),
            ),
          ),
        ],
      ),
    ],
  );
}
