import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mamago/page/home_page.dart';
import 'package:mamago/page/setting_page.dart';
import 'package:mamago/page/translation_page.dart';

final GlobalKey<NavigatorState> _rootNavkey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _subNavkey = GlobalKey<NavigatorState>();

BuildContext get rootContext => _rootNavkey.currentContext!;
BuildContext get subContext => _subNavkey.currentContext!;

final GoRouter router = GoRouter(
  initialLocation: "/translation",
  navigatorKey: _rootNavkey,
  routes: [
    ShellRoute(
      navigatorKey: _subNavkey,
      routes: [
        GoRoute(
          path: '/translation',
          pageBuilder: (context, state) => NoTransitionPage(child: TranslationPage(state: state)),
        ),
        GoRoute(
          path: '/setting',
          pageBuilder: (context, state) => NoTransitionPage(child: SettingPage(state: state)),
        ),
      ],
      pageBuilder: (context, state, child) => NoTransitionPage(child: HomePage(state: state, child: child)),
    )
  ],
);
