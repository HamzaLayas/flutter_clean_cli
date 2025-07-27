import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

import '../../presentation/views/page_not_found_view.dart';
import '../../presentation/views/splash_view.dart';
import '../../presentation/widgets/custom_offline_builder.dart';
import '../config/dependency_injection.dart';
import 'route_constants.dart';

class AppRouter {
  static final GetIt _sl = GetIt.instance;

  static final GoRouter routes = GoRouter(
    initialLocation: RouteConstants.kSplash,
    errorBuilder: (context, state) {
      return const PageNotFoundView();
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) => CustomOfflineBuilder(child: child),
        routes: [
          GoRoute(
            path: RouteConstants.kSplash,
            builder: (context, state) => SplashView(),
          ),
          // GoRoute(
          //   path: RouteConstants.kOnBoarding,
          //   builder: (context, state) => BlocProvider(
          //     create: (_) => OnboardingCubit(),
          //     child: OnboardingView(),
          //   ),
          // ),
        ],
      ),
    ],
  );
}
