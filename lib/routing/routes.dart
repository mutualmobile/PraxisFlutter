import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:praxis_flutter/features/home/home_page_screen.dart';
import 'package:praxis_flutter/features/login/login_page.dart';
import 'package:praxis_flutter/features/splash/splash_cubit.dart';
import 'package:praxis_flutter/features/splash/splash_page.dart';

const loginRoute = '/login';
const homeRoute = '/home';
const rootRoute = '/';

final praxisRoutes = GoRouter(
  routes: [splashRoute(), loginPageRoute(), homePageRoute()],
);

GoRoute homePageRoute() {
  return GoRoute(
    path: homeRoute,
    builder: (context, state) => const HomePageScreen(),
  );
}

GoRoute loginPageRoute() {
  return GoRoute(
    path: loginRoute,
    builder: (context, state) => const LoginPage(),
  );
}

GoRoute splashRoute() {
  return GoRoute(
    path: rootRoute,
    builder: (context, state) => BlocProvider(
      create: (_) => SplashCubit(false),
      child: const SplashScreen(),
    ),
  );
}
