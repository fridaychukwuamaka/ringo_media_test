import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/ui/pages/login_page.dart';
import '../../features/home/presentation/ui/pages/home_page.dart';

part 'route_name.dart';

final GoRouter _appRouter = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      name: RouteName.login,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/home',
      name: RouteName.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
  ],
);

final appRouter = Provider((ref) => _appRouter);
