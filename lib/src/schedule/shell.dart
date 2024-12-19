import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:ramadantimes/l10n/app_localizations.dart';
import 'package:ramadantimes/src/langauage/language_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../bloc/navigation_cubit/navigation_cubit.dart';
import '../models/named_navigation_bar.dart';
import '../settings/presentation/page/settings_page.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class ShellPage extends StatefulWidget {
  const ShellPage({super.key, required this.child});

  // final String title;
  final Widget child;

  @override
  ShellPageState createState() => ShellPageState();
}

class ShellPageState extends State<ShellPage> {
  @override
  void initState() {
    // apiServices = ApiServices();

    context.read<NavigationCubit>().getNavBarItem(0);
    super.initState();
  }

  // static int _calculateSelectedIndex(BuildContext context) {
  //   final String location = GoRouterState.of(context).location;
  //   if (location.startsWith('/') && location.length == 1) {
  //     return 0;
  //   }
  //   if (location.startsWith('/products')) {
  //     return 1;
  //   }
  //   if (location.startsWith('/cart')) {
  //     return 3;
  //   }
  //   if (location.startsWith('/profile')) {
  //     return 4;
  //   }
  //   return 0;
  // }

  // void _onItemTapped(int index, BuildContext context) {
  //   switch (index) {
  //     case 0:
  //       GoRouter.of(context).go('/');
  //       break;
  //     case 1:
  //       GoRouter.of(context).go('/products');
  //       break;
  //     case 3:
  //       GoRouter.of(context).go('/cart');
  //       break;
  //     case 4:
  //       GoRouter.of(context).go('/profile');
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      NamedNavigationBarItemWidget(
        // iconSize: 24,
        label: AppLocalizations.of(context)?.schedule ?? "",
        icon: Image.asset(
          "assets/images/schedule.png",
          height: 32,
          width: 32,
          color: const Color(0xffC3BEDF),
        ),
        selectedIcon: Image.asset(
          "assets/images/schedule.png",
          height: 32,
          width: 32,
          color: const Color(0xff6348EB),
        ),
        initialLocation: '/',
      ),
      NamedNavigationBarItemWidget(
        label: AppLocalizations.of(context)?.maslaMasail ?? "",
        icon: Image.asset(
          "assets/images/masla.png",
          height: 32,
          width: 32,
          // color: Color(0xffC3BEDF),
        ),
        selectedIcon: Image.asset(
          "assets/images/masla1.png",
          height: 32,
          width: 32,
          // color: Color(0xff6348EB),
        ),
        initialLocation: '/masla-masail',
      ),
      NamedNavigationBarItemWidget(
        label: AppLocalizations.of(context)?.calendar ?? "",
        icon: Image.asset(
          "assets/images/calendar.png",
          height: 32,
          width: 32,
          color: const Color(0xffC3BEDF),
        ),
        selectedIcon: Image.asset(
          "assets/images/calendar.png",
          height: 32,
          width: 32,
          color: const Color(0xff6348EB),
        ),
        initialLocation: '/calendar',
      ),
    ];
    return Scaffold(
      key: _key,
      // appBar: AppBar(),
      extendBody: true,

      drawer: const CommonDrawer(),
      backgroundColor: const Color(0xfff2f2ef),
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Stack(
        children: [
          widget.child,
          Positioned(
              top: MediaQuery.of(context).viewPadding.top + 4,
              left: 24,
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.grey.withOpacity(.1),
                          blurRadius: 6,
                          spreadRadius: 6)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                  onPressed: () {
                    _key.currentState?.openDrawer();
                  },
                  icon: Image.asset(
                    "assets/images/menuIcon.png",
                    height: 24.spMin,
                    width: 24.w,
                  ),
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          // padding: const EdgeInsets.only(bottom: 16.0, left: 12, right: 12),
          child: _buildBottomNavigation(context, tabs)),
    );
  }
}

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        color: Colors.white,
        child: Column(children: [
          Image.asset("assets/images/drawer_head.png"),
          Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: const Color(0xfff7f5ff),
              padding: EdgeInsets.only(top: 12, bottom: 12, left: 24.w),
              child: Column(
                children: [
                  DrawerItem(
                    icon: const Icon(CupertinoIcons.globe),
                    title:
                        AppLocalizations.of(context)?.changeAppLanguage ?? "",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LanguageSelector();
                        },
                      ));
                    },
                  ),
                  DrawerItem(
                    icon: const Icon(Icons.location_pin),
                    title:
                        AppLocalizations.of(context)?.changeAppLocation ?? "",
                  ),
                  DrawerItem(
                    icon: const Icon(Icons.settings),
                    title: AppLocalizations.of(context)!.settings,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SettingsScreen();
                        },
                      ));
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  DrawerItem(
                    icon: const Icon(Icons.mosque_outlined),
                    title: AppLocalizations.of(context)?.schedule ?? "",
                    onTap: () {
                      context.pop();
                      context.goNamed("schedule");

                      context.read<NavigationCubit>().getNavBarItem(0);
                    },
                  ),
                  DrawerItem(
                    icon: const Icon(Icons.book_rounded),
                    title: AppLocalizations.of(context)?.maslaMasail ?? "",
                    onTap: () {
                      context.pop();
                      context.goNamed("masla-masail");

                      context.read<NavigationCubit>().getNavBarItem(1);
                    },
                  ),
                  DrawerItem(
                    icon: const Icon(Icons.calendar_month),
                    title: AppLocalizations.of(context)?.calendar ?? "",
                    onTap: () {
                      context.pop();
                      context.goNamed("calendar");

                      context.read<NavigationCubit>().getNavBarItem(2);
                    },
                  ),
                  DrawerItem(
                    icon: const Icon(Icons.menu_book),
                    title: AppLocalizations.of(context)?.quran ?? "",
                    onTap: () {
                      context.pop();
                      context.goNamed("quran_surah");

                      context.read<NavigationCubit>().getNavBarItem(2);
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  DrawerItem(
                    icon: const Icon(Icons.share),
                    title: AppLocalizations.of(context)?.shareApp ?? "",
                    onTap: () {
                      Share.share(
                          'check out this App https://play.google.com/store/apps/details?id=com.devxhub.ramadantimes',
                          subject: 'Look what they made!');
                    },
                  ),
                  DrawerItem(
                    icon: const Icon(Icons.star),
                    title: AppLocalizations.of(context)?.rateThisApp ?? "",
                    onTap: () async {
                      context.pop();
                      final InAppReview inAppReview = InAppReview.instance;

                      if (await inAppReview.isAvailable()) {
                        inAppReview.requestReview();
                      }
                    },
                  ),
                  DrawerItem(
                    icon: const Icon(Icons.star),
                    title: AppLocalizations.of(context)?.privacyPolicy ?? "",
                    onTap: () async {
                      if (!await launchUrlString(
                          "https://devxhub.com/privacy-policy",
                          mode: LaunchMode.externalApplication)) {
                        throw Exception(
                            'Could not launch https://devxhub.com/privacy-policy');
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final Widget icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 12.w,
            ),
            AutoSizeText(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}

BlocBuilder<NavigationCubit, NavigationState> _buildBottomNavigation(
        mContext, List<NamedNavigationBarItemWidget> tabs) =>
    BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, state) {
        return NavigationBar(
            // height: 80,
            animationDuration: const Duration(milliseconds: 1000),
            backgroundColor: Colors.transparent,
            // surfaceTintColor: Colors.red,
            shadowColor: Colors.transparent,
            elevation: 0,
            selectedIndex: state.index,
            onDestinationSelected: (i) {
              if (state.index != i) {
                context.read<NavigationCubit>().getNavBarItem(i);
                context.go(tabs[i].initialLocation);
              }
            },
            destinations: tabs);
      },
    );
