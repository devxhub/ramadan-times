import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslimtimespro/src/auth/data/respositories/sign_in_repository.dart';
import 'package:muslimtimespro/src/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:muslimtimespro/src/bloc/NextDayTiming/next_day_timing_cubit.dart';
import 'package:muslimtimespro/src/bloc/language_bloc/language_bloc.dart';
import 'package:muslimtimespro/src/bloc/location/country_cubit.dart';
import 'package:muslimtimespro/src/calender/data/repositories/calender_repository.dart';
import 'package:muslimtimespro/src/calender/presentation/bloc/calendar_bloc.dart';
import 'package:muslimtimespro/src/bloc/home/bloc/calendar_bloc.dart';
import 'package:muslimtimespro/src/bloc/home/home_cubit.dart';
import 'package:muslimtimespro/src/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:muslimtimespro/src/prayer_times/data/repositories/prayer_time_repository.dart';
import 'package:muslimtimespro/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';
import 'package:muslimtimespro/src/quran/data/repository/quran_repository.dart';
import 'package:muslimtimespro/src/services/api_service.dart';
import 'package:muslimtimespro/src/services/api_service_masail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/app.dart';
import 'src/auth/data/respositories/sign_up_repository.dart';
import 'src/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'src/bloc/infinite_masail_list/masail_bloc.dart';
import 'src/bloc/location/location_cubit.dart';
import 'src/quran/presentation/bloc/quran_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPrayerConvention();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue,
    statusBarColor: Colors.transparent,
  ));

  runApp(MultiBlocProvider(providers: [
    BlocProvider<PrayerTimeBloc>(
      create: (BuildContext context) {
        return PrayerTimeBloc(prayerTimeRepository: PrayerTimeRepository());
      },
    ),
    BlocProvider<SignInBloc>(
      create: (BuildContext context) {
        return SignInBloc(signInRepository: SignInRepository());
      },
    ),
    BlocProvider<SignUpBloc>(
      create: (BuildContext context) {
        return SignUpBloc(signUpRepository: SignUpRepository());
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

Future<void> setPrayerConvention() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? prayerConventionName = prefs.getString('selectedConvention');
  if (prayerConventionName == null) {
    prefs.setString('selectedConvention', 'Muslim World League');
    prefs.setDouble('fajrAngle', 15.0);
    prefs.setDouble('ishaAngle', 15.0);
  }
}
