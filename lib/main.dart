import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:secondapp/screens/lenses_order_screen.dart';
import 'package:secondapp/screens/login.dart';
import 'package:secondapp/screens/product_detail_screen.dart';
import 'package:secondapp/screens/signup.dart';
import 'package:secondapp/screens/verfiy_email_screen.dart';
import 'package:secondapp/warehouse/screens/basicScreen/add_Order_Screen/add_order_screen.dart';
import 'package:secondapp/warehouse/screens/basicScreen/order_Management_Screen/excuted-order-screen.dart';
import 'package:secondapp/warehouse/screens/basicScreen/order_Management_Screen/new_order_screen.dart';
import 'package:secondapp/warehouse/screens/basicScreen/order_Management_Screen/order_management_screen.dart';
import 'package:secondapp/warehouse/screens/basicScreen/product_Management_Screen/product_management_screen.dart';
import 'package:secondapp/warehouse/screens/warehouse_home.dart';
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
    GoRoute(
      path: '/verify',
      builder: (context, state) => Verificatoin(),
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
                  routes: [
                    GoRoute(
                        path: 'details/:id',
                        pageBuilder: (context, state) {
                          final id = state.pathParameters['id']!;
                          return NoTransitionPage(child: ProductDetail(id));
                        }),
                  ]),
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
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: Maintenance(),
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
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return WareHoseHomePage(navigationShell: navigationShell);
        },
        branches: [
          // first branch (A)
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'warehouse'),
            routes: [
              // top route inside branch
              GoRoute(
                  path: '/warehouse',
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: OrderManagementScreen(),
                      ),
                  routes: [
                    GoRoute(
                      path: 'completed-orders',
                      pageBuilder: (context, state) => NoTransitionPage(
                        child: ExcutedOrderScreen(),
                      ),
                    ),
                    GoRoute(
                      path: 'new-orders',
                      pageBuilder: (context, state) => NoTransitionPage(
                        child: NewOrderScreen(),
                      ),
                    ),
                  ]),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'proucts'),
            routes: [
              // top route inside branch
              GoRoute(
                path: '/proucts',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: ProductManagementScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'add-order'),
            routes: [
              // top route inside branch
              GoRoute(
                path: '/add-order',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: AddOrder(),
                ),
              ),
            ],
          ),
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
