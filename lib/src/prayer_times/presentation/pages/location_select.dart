import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadantimes/src/prayer_times/data/models/country_response.dart';
import 'package:ramadantimes/src/prayer_times/data/models/user_coordinates.dart';
import 'package:ramadantimes/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';

import '../../../bloc/location/location_cubit.dart';
import '../../../bloc/location/location_state.dart';
import '../../../models/address/district.dart';

class UserLocationSelect extends StatefulWidget {
  const UserLocationSelect({super.key});

  @override
  State<UserLocationSelect> createState() => _UserLocationSelectState();
}

class _UserLocationSelectState extends State<UserLocationSelect> {
  Country? selectedCountry;
  District? selectedLocation;

  @override
  void initState() {
    context.read<LocationCubit>().loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Select user location"),
      ),
      body: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
        builder: (context, prayerTimeState) {
          final countryList = prayerTimeState.countryResponse.countries ?? [];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Select Your Country",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.h),
                DropdownButton<Country>(
                  hint: const Text("Select a Country"),
                  value: prayerTimeState.selectedCountry,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(12.r),
                  menuMaxHeight: 400.h,
                  underline: Container(height: 1, color: Colors.grey.shade400),
                  items: countryList.map((country) {
                    return DropdownMenuItem<Country>(
                      value: country,
                      child: Text(country.name ?? "Unknown"),
                    );
                  }).toList(),
                  onChanged: (Country? newValue) {
                    context.read<PrayerTimeBloc>().add(
                        PrayerTimeEvent.selectCountry(
                            context: context, country: newValue ?? Country()));
                  },
                ),
                if (prayerTimeState.selectedCountry?.name
                        ?.toString()
                        .toLowerCase() ==
                    "bangladesh") ...[
                  SizedBox(height: 24.h),
                  const Text(
                    "Select Your City",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8.h),
                  BlocBuilder<LocationCubit, LocationState<List<District>>>(
                    builder: (context, state) {
                      return state.when(
                        idle: () => Container(),
                        loading: () => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        data: (data) => DropdownButton<District>(
                          hint: const Text("Select a City"),
                          value: prayerTimeState.selectedDistrict,
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(12.r),
                          menuMaxHeight: 400.h,
                          underline: Container(
                            height: 1,
                            color: Colors.grey.shade400,
                          ),
                          items: data.map((district) {
                            return DropdownMenuItem<District>(
                              value: district,
                              child: Text(district.name ?? "Unknown"),
                            );
                          }).toList(),
                          onChanged: (District? value) async {
                            context.read<PrayerTimeBloc>().add(
                                PrayerTimeEvent.selectCity(
                                    context: context,
                                    district: value ?? District()));
                          },
                        ),
                        error: (e) => Container(),
                      );
                    },
                  ),
                  prayerTimeState.isDistrictSelected == false
                      ? Text(
                          "Please Select a city",
                          style: TextStyle(color: Colors.red),
                        )
                      : SizedBox()
                ],
                GestureDetector(
                  onTap: () {
                    if (prayerTimeState.selectedCountry?.name
                            .toString()
                            .toLowerCase() ==
                        "bangladesh") {
                      if (prayerTimeState.selectedDistrict?.name?.isNotEmpty ==
                          true) {
                        context
                            .read<PrayerTimeBloc>()
                            .add(PrayerTimeEvent.submitLocation(
                                context: context,
                                userCoordinator: UserCoordinator(
                                  userCountryIso: prayerTimeState
                                          .selectedCountry?.countryCode ??
                                      "",
                                  userCity:
                                      prayerTimeState.selectedDistrict?.name ??
                                          "",
                                  userCountry:
                                      prayerTimeState.selectedCountry?.name ??
                                          '',
                                  userLng: double.parse(prayerTimeState
                                          .selectedDistrict?.lon
                                          .toString() ??
                                      ""),
                                  userLat: double.parse(prayerTimeState
                                          .selectedDistrict?.lat
                                          .toString() ??
                                      ""),
                                )));
                      } else {
                        context.read<PrayerTimeBloc>().add(
                            PrayerTimeEvent.isDistrictSelected(
                                context: context, isDistrictSelected: false));
                      }
                    } else {
                      context.read<PrayerTimeBloc>().add(PrayerTimeEvent
                          .submitLocation(
                              context: context,
                              userCoordinator: UserCoordinator(
                                  userCountryIso: prayerTimeState
                                          .selectedCountry?.countryCode ??
                                      "",
                                  userCity: prayerTimeState
                                          .selectedCountry?.capitalCity ??
                                      "",
                                  userCountry:
                                      prayerTimeState.selectedCountry?.name ??
                                          '',
                                  userLng:
                                      prayerTimeState.selectedCountry?.long,
                                  userLat:
                                      prayerTimeState.selectedCountry?.lat)));
                    }
                  },
                  child: Container(
                    height: 40.h,
                    width: 300.w,
                    color: Colors.red,
                    child: Center(
                        child: prayerTimeState.prayerTimeStatus ==
                                PrayerTimeStatus.initial
                            ? CircularProgressIndicator()
                            : Text("Save")),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
