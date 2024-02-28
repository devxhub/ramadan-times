import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart' as loc;
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/home/bloc/calendar_bloc.dart';
import '../bloc/home/bloc/calendar_event.dart';
import '../bloc/location/location_cubit.dart';
import '../bloc/location/location_state.dart';
import '../models/address/district.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({super.key});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  double initialLat = 0.0;
  double initialLong = 0.0;
  final loc.Location location = loc.Location();

  Future<bool> requestPermission() async {
    final permission = await location.requestPermission();
    return permission == loc.PermissionStatus.granted;
  }

  Future<loc.LocationData> getCurrentLocation() async {
    final locationData = await location.getLocation();
    if (kDebugMode) {
      print("Calling LocationPicker locationData $locationData}");
    }
    return locationData;
  }

  Future<Map<String, dynamic>> getCurrentLocationDetails() async {
    final locationData = await location.getLocation();
    if (kDebugMode) {
      print("Calling LocationPicker locationData $locationData}");
    }

    List<Placemark> placemarks = await placemarkFromCoordinates(
        locationData.latitude!, locationData.longitude!);

    // Extracting place name and district name
    String? placeName = placemarks.isNotEmpty ? placemarks[0].name : null;
    String? district =
        placemarks.isNotEmpty ? placemarks[0].subAdministrativeArea : null;

    // Create a map to hold all the location data
    Map<String, dynamic> locationDetails = {
      'latitude': locationData.latitude,
      'longitude': locationData.longitude,
      'placeName': placeName,
      'district': district,
      // Add more data as needed
    };
    if (kDebugMode) {
      print("locationDetails:$locationDetails");
    }
    return locationDetails;
  }

  @override
  void initState() {
    super.initState();
    context.read<LocationCubit>().loadData();
    requestPermission().then((granted) {
      if (granted) {
        getCurrentLocation().then((locationData) {
          setState(() {
            initialLat = locationData.latitude ?? 0.0;
            initialLong = locationData.longitude ?? 0.0;
          });
          if (kDebugMode) {
            print("Calling LocationPicker $initialLat ====== $initialLong");
          }
          getCurrentLocationDetails().then((details) {
            if (kDebugMode) {
              print("Details: $details");
            }
            if (details['district'] != null) {
              String districtName = details['district'].split(' ').first;

              if (kDebugMode) {
                print("District Name from Location Data: $districtName");
              }
            } else {
              if (kDebugMode) {
                print("No district information found in location details.");
              }
            }
          }).catchError((error) {
            if (kDebugMode) {
              print("Error getting location details: $error");
            }
          });
        });
      }
    });
  }

  setLocation() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    District d = District.fromJson(
      jsonDecode(
        prefs.getString("current_location") ??
            jsonEncode(
              District(
                  id: "47",
                  division_id: "6",
                  name: "Dhaka",
                  bn_name: "ঢাকা",
                  lat: "23.7115253",
                  lon: "90.4111451",
                  url: "www.dhaka.gov.bd"),
            ),
      ),
    );

    // print(d.bn_name);

    selectedLocation = d;
  }

  District? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: EdgeInsets.only(right: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 2)
          ]),
      child: BlocBuilder<LocationCubit, LocationState<List<District>>>(
        builder: (context, state) {
          return state.when(idle: () {
            return Container();
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }, data: (data) {
            return Row(
              children: [
                const Icon(Icons.location_pin),
                const SizedBox(
                  width: 8,
                ),
                DropdownButton<District>(
                  hint: AutoSizeText(selectedLocation?.bn_name ?? ""),
                  // value: selectedLocation,
                  borderRadius: BorderRadius.circular(12.r),
                  menuMaxHeight: 600.h,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: data.map(
                    (e) {
                      return DropdownMenuItem(
                          value: e, child: AutoSizeText(e.bn_name));
                    },
                  ).toList(),
                  onChanged: (v) async {
                    setState(() {
                      selectedLocation = v!;
                    });
                    // Obtain shared preferences.
                    final prefs = await SharedPreferences.getInstance();
                    String data = jsonEncode(v);

                    prefs.setString("current_location", data);
                    if (kDebugMode) {
                      print("object");
                    }
                    if (!mounted) return;
                    context.read<HomeBloc>().add(
                          DataFetched(
                              date: DateFormat("dd-MM-yyyy").format(
                                DateTime.now(),
                              ),
                              city: v!.name),
                        );
                    if (kDebugMode) {
                      print("object1");
                    }
                  },
                ),
              ],
            );
          }, error: (e) {
            return Container();
          });
        },
      ),
    );
  }
}
