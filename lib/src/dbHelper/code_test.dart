// import 'package:connectivity/connectivity.dart';
// import 'package:path_provider/path_provider.dart';
// import 'database_helper.dart';
//
// Future<void> _fetchData() async {
//   setState(() {
//     _isLoading = true;
//   });
//
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   final dbHelper = DatabaseHelper.instance;
//   if (connectivityResult == ConnectivityResult.none) {
//     // Load data from local storage if offline
//     final storedData = await dbHelper.queryAllRows();
//     setState(() {
//       _prayerTimesData = storedData
//           .map<PrayerTimesData>((item) => PrayerTimesData(
//         date: item['date'],
//         fajr: item['fajr'],
//         dhuhr: item['dhuhr'],
//         asr: item['asr'],
//         maghrib: item['maghrib'],
//         isha: item['isha'],
//       ))
//           .toList();
//       _isLoading = false;
//     });
//   } else {
//     // Fetch data from the API and store it locally
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       setState(() {
//         _isLoading = false;
//       });
//
//       // Save data to sqflite
//       await dbHelper.saveJsonData(response.body);
//
//       // Retrieve data from sqflite
//       final storedData = await dbHelper.queryAllRows();
//       setState(() {
//         _prayerTimesData = storedData
//             .map<PrayerTimesData>((item) => PrayerTimesData(
//           date: item['date'],
//           fajr: item['fajr'],
//           dhuhr: item['dhuhr'],
//           asr: item['asr'],
//           maghrib: item['maghrib'],
//           isha: item['isha'],
//         ))
//             .toList();
//       });
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
// }