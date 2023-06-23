import 'package:go_router/go_router.dart';
import 'package:mamago/page/home_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(child: HomePage(state: state)),
    ),
  ],
);
