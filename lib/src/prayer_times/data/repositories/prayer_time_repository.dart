import 'package:adhan/adhan.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/prayer_times/data/models/prayer_times.dart';

import '../../../services/dio_client.dart';

class PrayerTimeRepository {
  late DioClient dioClient;
  final String _baseUrl = "";

  PrayerTimeRepository() {
    var dio = Dio();
    dioClient = DioClient(_baseUrl, dio);
  }

 Future<PrayerTimesResponse>generatePrayerTimes({required double latitude,required double longitude})async {
    if(latitude.isFinite){

      final coordinates = Coordinates(latitude, longitude); // Example: London
      CalculationParameters calculationMethod = CalculationParameters(
        method: CalculationMethod.muslim_world_league,
        fajrAngle: 18.0,
        ishaAngle: 17.0,
        ishaInterval: 0,
        madhab: Madhab.hanafi,
        highLatitudeRule: HighLatitudeRule.middle_of_the_night,
      );
      try{
        final today =DateTime.now();

        final prayerTimesForDay = PrayerTimes(coordinates, DateComponents(today.year, today.month, today.day), calculationMethod); // 5 mins before and after Dhuhr
        final tahajjudEnd = prayerTimesForDay.fajr.subtract(Duration(minutes: 10)); // End 10 minutes before Fajr

        ///fazr
        final fajrStart=prayerTimesForDay.fajr;
        final fajrEnd = prayerTimesForDay.sunrise;
        final dhuhrStart=prayerTimesForDay.dhuhr;
        final dhuhrEnd = prayerTimesForDay.asr; // Dhuhr ends at Asr
        final  asrStart=prayerTimesForDay.asr;
        final asrEnd = prayerTimesForDay.maghrib; // Asr ends at Maghrib
        final  maghribStart=prayerTimesForDay.maghrib;
        final maghribEnd = prayerTimesForDay.isha; // Maghrib ends at Isha
        final  ishaStart=prayerTimesForDay.isha;
        final ishaEnd = prayerTimesForDay.fajr.add(Duration(days: 1));
        final awwabinStart = prayerTimesForDay.maghrib.add(Duration(minutes: 5)); // Start 5 minutes after Maghrib
        final awwabinEnd = prayerTimesForDay.isha; // Ends at Isha time// Isha ends at Fajr of the next day
        ///sun
        final sunrise=prayerTimesForDay.sunrise;
        final sunset=prayerTimesForDay.maghrib;
        ///prohibitted time

        final dawnStart=fajrEnd;
        final dawnEnd=fajrEnd.add(Duration(minutes: 15));
        final noonStart=dhuhrStart.subtract(Duration(minutes:8 ));
        final noonEnd=dhuhrStart;
        final eveningStart=maghribStart.subtract(Duration(minutes:19 ));
        final eveningEnd=maghribStart.subtract(Duration(minutes:4));
        return PrayerTimesResponse(fajrStart: fajrStart.toString(),
            fajrEnd: fajrEnd.toString(),
            sunrise: sunrise.toString(),
            sunset: sunset.toString(),
            dhuhrStart: dhuhrStart.toString(),
            dhuhrEnd: dhuhrEnd.toString(),
            asrStart: asrStart.toString(),
            asrEnd: asrEnd.toString(),
            maghribStart: maghribStart.toString(),
            maghribEnd: maghribEnd.toString(),
            ishaStart: ishaStart.toString(),
            ishaEnd: ishaEnd.toString(),
            sehri: fajrStart.toString(),
            iftar: maghribStart.toString(),
            awwabinStart: awwabinStart.toString(),
            awwabinEnd: awwabinEnd.toString(),
            dawnStart: dawnStart.toString(),
            dawnEnd: dawnEnd.toString(),
            noonStart:noonStart.toString() ,
            noonEnd: noonEnd.toString(),
            eveningStart: eveningStart.toString(),
            eveningEnd: eveningEnd.toString(), tahajjudEnd: tahajjudEnd.toString());
      }catch(e){
        print("settingsGetUserModelDataLoadedResponse: $e");
        rethrow;
      }

    }else{
      return PrayerTimesResponse();
    }

  }

}