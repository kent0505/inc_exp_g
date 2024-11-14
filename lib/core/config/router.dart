import 'package:go_router/go_router.dart';

import '../../features/home/pages/history_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/inc_exp/pages/add_page.dart';
import '../../features/inc_exp/pages/edit_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../models/inc_exp.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => AddPage(
            isIncome: state.extra as bool,
          ),
        ),
        GoRoute(
          path: 'edit',
          builder: (context, state) => EditPage(
            model: state.extra as IncExp,
          ),
        ),
        GoRoute(
          path: 'history',
          builder: (context, state) => const HistoryPage(),
        ),
      ],
    ),
  ],
);
