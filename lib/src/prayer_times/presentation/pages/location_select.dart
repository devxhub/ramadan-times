import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgen_button/nextgen_button.dart';
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
    context.read<PrayerTimeBloc>().add(PrayerTimeEvent.clearSelectedLocation());
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
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Your Country",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<Country>(
                  decoration: InputDecoration(
                    labelText: "Select a Country",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12.r), // Circular border
                    ),
                  ),
                  value: prayerTimeState.selectedCountry,
                  isExpanded: true,
                  menuMaxHeight: 400.h,
                  items: countryList.map((country) {
                    return DropdownMenuItem<Country>(
                      value: country,
                      child: Text(country.name ?? "Unknown"),
                    );
                  }).toList(),
                  onChanged: (Country? newValue) {
                    context.read<PrayerTimeBloc>().add(
                          PrayerTimeEvent.selectCountry(
                            context: context,
                            country: newValue ?? Country(),
                          ),
                        );
                  },
                ),
                if (prayerTimeState.selectedCountry?.name
                        ?.toString()
                        .toLowerCase() ==
                    "bangladesh") ...[
                  SizedBox(height: 24.h),
                  Text(
                    "Select Your City",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  BlocBuilder<LocationCubit, LocationState<List<District>>>(
                    builder: (context, state) {
                      return state.when(
                        idle: () => Container(),
                        loading: () => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        data: (data) => DropdownButtonFormField<District>(
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "Select a City",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.h),
                          ),
                          value: prayerTimeState.selectedDistrict,
                          isExpanded: true,
                          menuMaxHeight: 400.h,
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
                                    district: value ?? District(),
                                  ),
                                );
                          },
                        ),
                        error: (e) => Container(),
                      );
                    },
                  ),
                  prayerTimeState.isDistrictSelected == false
                      ? Text(
                          "Please Select a city",
                          style: TextStyle(color: Colors.red, fontSize: 14.sp),
                        )
                      : SizedBox()
                ],
                Expanded(child: SizedBox()),
                NextGenButton(
                  onTap: () {
                    if (prayerTimeState.selectedCountry?.name
                            .toString()
                            .toLowerCase() ==
                        "bangladesh") {
                      if (prayerTimeState.selectedDistrict?.name?.isNotEmpty ==
                          true) {
                        context.read<PrayerTimeBloc>().add(
                              PrayerTimeEvent.submitLocation(
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
                                ),
                              ),
                            );
                      } else {
                        context.read<PrayerTimeBloc>().add(
                              PrayerTimeEvent.isDistrictSelected(
                                context: context,
                                isDistrictSelected: false,
                              ),
                            );
                      }
                    } else {
                      context.read<PrayerTimeBloc>().add(
                            PrayerTimeEvent.submitLocation(
                              context: context,
                              userCoordinator: UserCoordinator(
                                userCountryIso: prayerTimeState
                                        .selectedCountry?.countryCode ??
                                    "",
                                userCity: prayerTimeState
                                        .selectedCountry?.capitalCity ??
                                    "",
                                userCountry:
                                    prayerTimeState.selectedCountry?.name ?? '',
                                userLng: prayerTimeState.selectedCountry?.long,
                                userLat: prayerTimeState.selectedCountry?.lat,
                              ),
                            ),
                          );
                    }
                  },
                  color: const Color(0xff674cec), // Set the background color
                  borderColor: Colors.transparent, // No border
                  height: 40.h, // Adjust the height of the button
                  width: 300.w, // Adjust the width of the button
                  radius: 8.0, // Optional: Add corner radius
                  isLoading: prayerTimeState.prayerTimeStatus ==
                      PrayerTimeStatus.initial, // Show loading indicator
                  titleText: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 16.w,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
