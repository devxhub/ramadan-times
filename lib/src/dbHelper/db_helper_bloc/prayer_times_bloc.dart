// import 'dart:async';
//
// import 'package:connectivity/connectivity.dart';
// import 'package:http/http.dart' as http;
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:path/path.dart';
// import 'package:muslimtimespro/src/dbHelper/database_helper.dart';
// import 'package:muslimtimespro/src/dbHelper/dbhelp.dart';
//
// part 'prayer_times_event.dart';
// part 'prayer_times_state.dart';
//
// class PrayerTimesBloc extends Bloc<PrayerTimesEvent, PrayerTimesState> {
//   final dbHelper = DBHelp.instance;
//
//   PrayerTimesBloc() : super(PrayerTimesLoading());
//
//   @override
//   Stream<PrayerTimesState> mapEventToState(PrayerTimesEvent event) async* {
//     if (event is FetchPrayerTimes) {
//       yield PrayerTimesLoading();
//
//       var connectivityResult = await (Connectivity().checkConnectivity());
//
//       if (connectivityResult == ConnectivityResult.none) {
//         try {
//           final storedData = await dbHelper.queryAllRows();
//           yield PrayerTimesLoaded(
//             storedData
//                 .map<DatabaseHelper>((item) => databaseHelper(
//               date: item['date'],
//               fajr: item['fajr'],
//               dhuhr: item['dhuhr'],
//               asr: item['asr'],
//               maghrib: item['maghrib'],
//               isha: item['isha'],
//             ))
//                 .toList(),
//           );
//         } catch (e) {
//           yield PrayerTimesError();
//         }
//       } else {
//         try {
//           final response = await http.get(url as Uri);
//
//           if (response.statusCode == 200) {
//             await dbHelper.saveJsonData(response.body);
//
//             final storedData = await dbHelper.queryAllRows();
//             yield PrayerTimesLoaded(
//               storedData
//                   .map<DatabaseHelper>((item) => databaseHelper(
//                 date: item['date'],
//                 fajr: item['fajr'],
//                 dhuhr: item['dhuhr'],
//                 asr: item['asr'],
//                 maghrib: item['maghrib'],
//                 isha: item['isha'],
//               ))
//                   .toList(),
//             );
//           } else {
//             yield PrayerTimesError();
//           }
//         } catch (e) {
//           yield PrayerTimesError();
//         }
//       }
//     }
//   }
//
//   databaseHelper({required date, required fajr, required dhuhr, required asr, required maghrib, required isha}) {}
// }
