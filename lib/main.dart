import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:secondapp/screens/lenses_order_screen.dart';
import 'package:secondapp/screens/login.dart';
import 'package:secondapp/screens/signup.dart';
import 'package:secondapp/widget/home_page.dart';

import 'di/service_locator.dart';

import './screens/home_page_screen.dart';
import './screens/introduction_screen.dart';
import 'screens/maintenance_order_screen.dart';
import 'screens/menu_page_screen.dart';
import 'screens/my_order_screen.dart';
import 'screens/profile.dart';

// private navigators

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => IntroductionScren(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => Login(),
    ),
    GoRoute(
      path: '/singup',
      builder: (context, state) => Signup(),
    ),
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return HomePageScreen(navigationShell: navigationShell);
        },
        branches: [
          // first branch (A)
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'home'),
            routes: [
              // top route inside branch
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: HomePage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'menu'),
              routes: [
                // top route inside branch
                GoRoute(
                    path: '/menu',
                    pageBuilder: (context, state) => NoTransitionPage(
                          child: MenuPageScreen(),
                        ),
                    routes: [
                      GoRoute(
                        path: 'my-orders',
                        pageBuilder: (context, state) => NoTransitionPage(
                          child: MyOrderScreen(),
                        ),
                      ),
                      GoRoute(
                        path: 'maintenance-order',
                        pageBuilder: (context, state) => NoTransitionPage(
                          child: MaintenanceOrderScreen(),
                        ),
                      ),
                      GoRoute(
                        path: 'lenses-order',
                        pageBuilder: (context, state) => NoTransitionPage(
                          child: LensesOrderScreen(),
                        ),
                      ),
                    ]),
              ]),
          StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'profile'),
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/profile',
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: Profile(),
                  ),
                ),
              ])
        ]),
  ],
);

void main() async {
  await _initHive();

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('ar'),
      title: 'المتحدة',
      routeInformationProvider: goRouter.routeInformationProvider,
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        primaryColor: Colors.amber,
        useMaterial3: true,
      ),
    );
  }
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("accounts");
}
