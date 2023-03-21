import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/calender/calender.dart';
import 'package:ramadantimes/src/component/splash_page.dart';
import 'package:ramadantimes/src/masla_masail/masla_masail.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../l10n/app_localizations.dart';
import 'schedule/schedule.dart';
import 'schedule/shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Intl.defaultLocale = 'bn_BD';

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: _router,
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            theme: ThemeData(
              textTheme:
                  GoogleFonts.anekBanglaTextTheme(Theme.of(context).textTheme),
              primarySwatch: Colors.blue,
              useMaterial3: true,
            ),
            locale: const Locale("bn", "BD"),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
          );
        });
  }
}

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: <RouteBase>[
    /// Application shell
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ShellPage(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: "schedule",
          builder: (BuildContext context, GoRouterState state) {
            return const SchedulePage();
          },

          // ],
        ),
        GoRoute(
          path: '/masla-masail',
          name: "masla-masail",
          builder: (BuildContext context, GoRouterState state) {
            return const MaslaMasailPage();
          },
        ),
        GoRoute(
          path: '/calendar',
          name: "calendar",
          builder: (BuildContext context, GoRouterState state) {
            return const CalendarPage();
          },
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/splash',
      name: "splash",
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },

      // ],
    ),
    // GoRoute(
    //   parentNavigatorKey: _rootNavigatorKey,
    //   path: '/auth',
    //   name: "auth",
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const LoginPage(
    //       title: 'Login',
    //     );
    //   },

    //   // ],
    // ),
    // GoRoute(
    //   parentNavigatorKey: _rootNavigatorKey,
    //   path: '/checkout',
    //   name: "checkout",
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const CheckOutPage();
    //   },

    //   // ],
    // ),
  ],
  // redirect: (context, state) async {
  //   return await wooApiServices.wooCommerce.isCustomerLoggedIn()
  //       ? state.location
  //       : "/auth";
  // },
);
