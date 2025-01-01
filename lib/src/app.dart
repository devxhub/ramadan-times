import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslimtimespro/src/auth/presentation/pages/sign_in_page.dart';
import 'package:muslimtimespro/src/calender/presentation/pages/calender.dart';
import 'package:muslimtimespro/src/component/splash_page.dart';
import 'package:muslimtimespro/src/masla_masail/masla_masail.dart';
import 'package:muslimtimespro/src/prayer_times/presentation/pages/location_select.dart';
import '../l10n/app_localizations.dart';
import 'auth/presentation/pages/forget_password/forget_password_otp_page.dart';
import 'auth/presentation/pages/forget_password/forget_password_page.dart';
import 'auth/presentation/pages/forget_password/reset_password_page.dart';
import 'auth/presentation/pages/sign_up_with_email.dart';
import 'prayer_times/presentation/pages/prayer_time_convention.dart';
import '../l10n/l10n.dart';
import 'bloc/language_bloc/language_bloc.dart';
import 'langauage/language_screen.dart';
import 'quran/presentation/pages/quran_surah_view.dart';
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

    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          ensureScreenSize: true,
          child: MaterialApp.router(
            routerConfig: _router,
            title: 'Ramadan Times',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme:
                  GoogleFonts.anekBanglaTextTheme(Theme.of(context).textTheme),
              primarySwatch: Colors.blue,
              navigationBarTheme: NavigationBarThemeData(
                  // indicatorShape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  iconTheme: WidgetStateProperty.resolveWith((states) =>
                      states.contains(WidgetState.selected)
                          ? const IconThemeData(size: 32)
                          : const IconThemeData(size: 32))),
              useMaterial3: true,
            ),
            supportedLocales: L10n.all,
            locale: Locale(state.locale.toString()),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        );
      },
    );
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
      path: '/location_select',
      name: "location_select",
      builder: (BuildContext context, GoRouterState state) {
        return const UserLocationSelect();
      },
    ),
    GoRoute(
      path: '/language_selector',
      name: "language_selector",
      builder: (BuildContext context, GoRouterState state) {
        return const LanguageSelector();
      },
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
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/quran_surah',
      name: "quran_surah",
      builder: (BuildContext context, GoRouterState state) {
        return const QuranSurahView();
      },
    ),

    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/prayer_time_convention',
      name: "prayer_time_convention",
      builder: (BuildContext context, GoRouterState state) {
        return PrayerTimeConvention();
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/sign_in_page',
      name: "sign_in_page",
      builder: (BuildContext context, GoRouterState state) {
        return SignInPage();
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/forgot_password_page',
      name: "forgot_password_page",
      builder: (BuildContext context, GoRouterState state) {
        return ForgotPasswordPage();
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/reset_password_page',
      name: "reset_password_page",
      builder: (BuildContext context, GoRouterState state) {
        return ResetPasswordPage();
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/forget_password_otp_page',
      name: "forget_password_otp_page",
      builder: (BuildContext context, GoRouterState state) {
        return ForgetPasswordOtpPage();
      },
    ),

    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/sign_up_page',
      name: "sign_up_page",
      builder: (BuildContext context, GoRouterState state) {
        return SignUpWithEmail();
      },
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
