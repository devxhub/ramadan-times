import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/bloc/NextDayTiming/next_day_timing_cubit.dart';
import 'package:ramadantimes/src/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:ramadantimes/src/bloc/home/bloc/calendar_bloc.dart';
import 'package:ramadantimes/src/bloc/home/home_cubit.dart';

import 'package:ramadantimes/src/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:ramadantimes/src/services/api_service.dart';
import 'package:ramadantimes/src/services/api_service_masail.dart';

import 'src/app.dart';
import 'src/bloc/infinite_masail_list/masail_bloc.dart';
import 'src/bloc/location/location_cubit.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue,
    statusBarColor: Colors.pink,
  ));
  // Intl.defaultLocale = 'bn_BD';
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NavigationCubit>(
      create: (BuildContext context) {
        return NavigationCubit();
      },
    ),
    BlocProvider<HomeCubit>(
      create: (BuildContext context) {
        return HomeCubit(apiRepository: ApiServices());
      },
    ),
    BlocProvider<HomeBloc>(
      create: (BuildContext context) {
        return HomeBloc(apiService: ApiServices());
      },
    ),
    BlocProvider<NextDayTimingCubit>(
      create: (BuildContext context) {
        return NextDayTimingCubit(apiRepository: ApiServices());
      },
    ),
    BlocProvider<CalendarBloc>(
      create: (BuildContext context) {
        return CalendarBloc(apiService: ApiServices());
      },
    ),
    BlocProvider<LocationCubit>(
      create: (BuildContext context) {
        return LocationCubit(apiServices: ApiServices());
      },
    ),
    BlocProvider<MasailBloc>(
      create: (BuildContext context) {
        return MasailBloc(masailApi: MasailApiServices());
      },
    ),
  ], child: const MyApp()));
}
