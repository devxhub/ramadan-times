import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadantimes/src/bloc/NextDayTiming/next_day_timing_cubit.dart';
import 'package:ramadantimes/src/bloc/language_bloc/language_bloc.dart';
import 'package:ramadantimes/src/bloc/location/country_cubit.dart';
import 'package:ramadantimes/src/calender/data/repositories/calender_repository.dart';
import 'package:ramadantimes/src/calender/presentation/bloc/calendar_bloc.dart';
import 'package:ramadantimes/src/bloc/home/bloc/calendar_bloc.dart';
import 'package:ramadantimes/src/bloc/home/home_cubit.dart';
import 'package:ramadantimes/src/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:ramadantimes/src/prayer_times/data/repositories/prayer_time_repository.dart';
import 'package:ramadantimes/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';
import 'package:ramadantimes/src/quran/data/repository/quran_repository.dart';
import 'package:ramadantimes/src/services/api_service.dart';
import 'package:ramadantimes/src/services/api_service_masail.dart';
import 'src/app.dart';
import 'src/bloc/infinite_masail_list/masail_bloc.dart';
import 'src/bloc/location/location_cubit.dart';
import 'src/quran/presentation/bloc/quran_bloc.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue,
    statusBarColor: Colors.transparent,
  ));
  // Intl.defaultLocale = 'bn_BD';
  runApp(MultiBlocProvider(providers: [
    BlocProvider<PrayerTimeBloc>(
      create: (BuildContext context) {
        return PrayerTimeBloc(prayerTimeRepository: PrayerTimeRepository());
      },
    ),
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
        return CalendarBloc(calenderRepository: CalenderRepository());
      },
    ),
    BlocProvider<LanguageBloc>(
      create: (BuildContext context) {
        return LanguageBloc();
      },
    ),
    BlocProvider<CountryCubit>(
      create: (BuildContext context) {
        return CountryCubit();
      },
    ),
    BlocProvider<CityCubit>(
      create: (BuildContext context) {
        return CityCubit();
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
    BlocProvider<QuranBloc>(
      create: (BuildContext context) {
        return QuranBloc(quranRepository: QuranRepository());
      },
    ),
  ], child: const MyApp()));
}
