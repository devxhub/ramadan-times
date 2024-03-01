import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/address/district.dart';


class LocationRepository {

    Future<District> getDistrictData() async {
      try {
        final districtDataResponse =
            await rootBundle.loadString('assets/locations/districts.json');
        District districtDataList =
            District.fromJson(jsonDecode(districtDataResponse));
        return districtDataList;
      } catch (e) {
        rethrow;
      }
    }

}
