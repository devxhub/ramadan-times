import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/home/bloc/calendar_bloc.dart';
import '../bloc/home/bloc/calendar_event.dart';
import '../bloc/location/location_cubit.dart';
import '../bloc/location/location_state.dart';
import '../models/address/district.dart';
import '../prayer_times/presentation/bloc/prayer_time_bloc.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({
    super.key,
  });

  // final bool mounted;

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  @override
  void initState() {
    setLocation();
    context.read<LocationCubit>().loadData();
    super.initState();
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
                          value: e, child: AutoSizeText(e.bn_name.toString()));
                    },
                  ).toList(),
                  onChanged: (v) async {
                    context.read<PrayerTimeBloc>().add(PrayerTimeEvent.prayerTimesDataLoaded(latitude: double.parse(v?.lat.toString()??"23.7115253"),longitude:double.parse(v?.lon.toString()??"90.4111451"), ));
                    setState(() {
                      selectedLocation = v!;
                    });
                    // Obtain shared preferences.
                    final prefs = await SharedPreferences.getInstance();
                    String data = jsonEncode(v);

                    prefs.setString("current_location", data);
                    print("object");
                    if (!mounted) return;
                    context.read<HomeBloc>().add(
                          DataFetched(
                              date: DateFormat("dd-MM-yyyy").format(
                                DateTime.now(),
                              ),
                              city: v!.name),
                        );
                    print("object1");
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
