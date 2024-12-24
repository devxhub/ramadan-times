import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgen_button/nextgen_button.dart';
import 'package:ramadantimes/l10n/app_localizations.dart';
import 'package:ramadantimes/src/bloc/location/country_cubit.dart';
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
  List<Country> filterCountryList = [];
  TextEditingController countryEditingController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();

  @override
  void initState() {
    context.read<LocationCubit>().loadData();
    context.read<PrayerTimeBloc>().add(PrayerTimeEvent.clearSelectedLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(AppLocalizations.of(context)!.selectUserLocation),
      ),
      body: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
        builder: (context, prayerTimeState) {
          final countryList = prayerTimeState.countryResponse.countries ?? [];
          filterCountryList = prayerTimeState.countryResponse.countries ?? [];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.selectYourCountry,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.h),
                Autocomplete<Country>(
                  optionsViewBuilder: (context, onSelected, options) {
                    return Container(
                      height: 300.w,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: DecoratedBox(
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ]),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: options.length,
                            itemBuilder: (context, index) {
                              final option = options.elementAt(index);
                              return option.name == 'No results found'
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!
                                              .noResultsFound,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    )
                                  : ListTile(
                                      title: Text(option.name ?? ''),
                                      onTap: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        context
                                            .read<CountryCubit>()
                                            .selectedCountry(option.name ?? '');
                                        context.read<PrayerTimeBloc>().add(
                                              PrayerTimeEvent.selectCountry(
                                                context: context,
                                                country: option,
                                              ),
                                            );
                                      },
                                    );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) async {
                    if (textEditingValue.text.isEmpty) {
                      return countryList;
                    }

                    final query = textEditingValue.text.toLowerCase();

                    // Exact matches: names that start with the search query
                    final exactMatches = filterCountryList.where((location) =>
                        location.name?.toLowerCase().startsWith(query) ??
                        false);

                    // Combine exact matches first, followed by partial matches
                    final filteredSkateParksData = [
                      ...exactMatches,
                      // ...partialMatches,
                    ];
                    // Return options or a placeholder for no results
                    return filteredSkateParksData.isEmpty
                        ? [Country(name: 'No results found')]
                        : filteredSkateParksData;
                  },
                  fieldViewBuilder: (context, textEditingController,
                          textSearchFocus, function) =>
                      BlocBuilder<CountryCubit, String>(
                    builder: (context, country) {
                      textEditingController.text = country;
                      return TextFormField(
                        focusNode: textSearchFocus,
                        onTapOutside: (PointerDownEvent event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          textEditingController.clear();
                        },
                        onChanged: (value) {
                          if (prayerTimeState
                                  .selectedCountry?.name?.isNotEmpty ==
                              true) {
                            context
                                .read<PrayerTimeBloc>()
                                .add(PrayerTimeEvent.clearSelectedLocation());
                          }
                        },
                        autofillHints: filterCountryList
                            .map((skatepark) => skatepark.name ?? '')
                            .toList(),
                        enableSuggestions: true,
                        controller: textEditingController,
                        decoration: InputDecoration(
                          labelText:
                              AppLocalizations.of(context)!.selectACountry,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12.r), // Circular border
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (prayerTimeState.selectedCountry?.name
                        ?.toString()
                        .toLowerCase() ==
                    "bangladesh") ...[
                  SizedBox(height: 24.h),
                  Text(
                    AppLocalizations.of(context)!.selectYourCity,
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
                        data: (data) {
                          return Autocomplete<District>(
                            optionsViewBuilder: (context, onSelected, options) {
                              if (options.isEmpty) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 300.h,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .noResultsFound,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16.sp),
                                    ),
                                  ],
                                );
                              }
                              return ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.circular(12.r),
                                child: DecoratedBox(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    primary: true,
                                    itemCount: options.length,
                                    itemBuilder: (context, index) {
                                      final option = options.elementAt(index);
                                      if (option.name == 'No results found') {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.0.w,
                                              vertical: height / 2),
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .noResultsFound,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16.sp),
                                            ),
                                          ),
                                        );
                                      }
                                      return Material(
                                        color: Colors.transparent,
                                        child: GestureDetector(
                                          onTap: () {
                                            // textEditingController
                                            //     .clear();
                                            cityEditingController.clear();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();

                                            context
                                                .read<CityCubit>()
                                                .selectedCity(
                                                    option.name ?? '');

                                            context.read<PrayerTimeBloc>().add(
                                                  PrayerTimeEvent.selectCity(
                                                    context: context,
                                                    district: option,
                                                  ),
                                                );
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0.w,
                                                vertical: 8.h),
                                            child: Text(option.name ?? ''),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                            optionsBuilder:
                                (TextEditingValue textEditingValue) async {
                              if (textEditingValue.text.isEmpty) {
                                return data;
                              }

                              final query = textEditingValue.text.toLowerCase();

                              // Exact matches: names that start with the search query
                              final exactMatches = data.where((skatepark) =>
                                  skatepark.name
                                      ?.toLowerCase()
                                      .startsWith(query) ??
                                  false);

                              // Combine exact matches first, followed by partial matches
                              final filteredSkateparksData = [
                                ...exactMatches,
                                // ...partialMatches
                              ];

                              // Return options or a placeholder for no results
                              return filteredSkateparksData.isEmpty
                                  ? [District(name: 'No results found')]
                                  : filteredSkateparksData;
                            },
                            fieldViewBuilder: (context, textEditingController,
                                    textSearchFocus, function) =>
                                BlocBuilder<CityCubit, String>(
                              builder: (context, city) {
                                textEditingController.text = city;
                                return TextFormField(
                                  focusNode: textSearchFocus,
                                  onTapOutside: (PointerDownEvent event) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    textEditingController.clear();
                                  },
                                  onChanged: (value) {
                                    if (prayerTimeState.selectedDistrict?.name
                                            ?.isNotEmpty ==
                                        true) {
                                      context.read<PrayerTimeBloc>().add(
                                          PrayerTimeEvent.clearSelectedCity());
                                    }
                                  },
                                  autofillHints: data
                                      .map((skatepark) => skatepark.name ?? '')
                                      .toList(),
                                  enableSuggestions: true,
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: AppLocalizations.of(context)!
                                        .selectACity,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 8.h),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        error: (e) => Container(),
                      );
                    },
                  ),
                  prayerTimeState.isDistrictSelected == false
                      ? Text(
                          AppLocalizations.of(context)!.pleaseSelectACity,
                          style: TextStyle(color: Colors.red, fontSize: 14.sp),
                        )
                      : SizedBox()
                ],
                Expanded(child: SizedBox()),
                NextGenButton(
                  onTap: () {
                    if (isCountryInList(
                        prayerTimeState.selectedCountry?.name ?? '',
                        countryList)) {
                      if (prayerTimeState.selectedCountry?.name
                              .toString()
                              .toLowerCase() ==
                          "bangladesh") {
                        if (prayerTimeState
                                .selectedDistrict?.name?.isNotEmpty ==
                            true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                AppLocalizations.of(context)!
                                    .countrySavedSuccessfully,
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.black,
                            ),
                          );
                          context.read<CountryCubit>().selectedCountry('');
                          context.read<CityCubit>().selectedCity('');
                          context.read<PrayerTimeBloc>().add(
                                PrayerTimeEvent.submitLocation(
                                  context: context,
                                  userCoordinator: UserCoordinator(
                                    userCountryIso: prayerTimeState
                                            .selectedCountry?.countryCode ??
                                        "",
                                    userCity: prayerTimeState
                                            .selectedDistrict?.name ??
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
                          context.read<CityCubit>().selectedCity('');
                          context.read<PrayerTimeBloc>().add(
                                PrayerTimeEvent.isDistrictSelected(
                                  context: context,
                                  isDistrictSelected: false,
                                ),
                              );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AppLocalizations.of(context)!
                                  .countrySavedSuccessfully,
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.black,
                          ),
                        );
                        context.read<CountryCubit>().selectedCountry('');
                        context.read<CityCubit>().selectedCity('');
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
                                      prayerTimeState.selectedCountry?.name ??
                                          '',
                                  userLng:
                                      prayerTimeState.selectedCountry?.long,
                                  userLat: prayerTimeState.selectedCountry?.lat,
                                ),
                              ),
                            );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppLocalizations.of(context)!
                                .countryIsNotFoundInTheList,
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  color: const Color(0xff674cec),
                  // Set the background color
                  borderColor: Colors.transparent,
                  // No border
                  height: 40.h,
                  // Adjust the height of the button
                  width: 300.w,
                  // Adjust the width of the button
                  radius: 8.0,
                  // Optional: Add corner radius
                  isLoading: prayerTimeState.prayerTimeStatus ==
                      PrayerTimeStatus.initial,
                  // Show loading indicator
                  titleText: Text(
                    AppLocalizations.of(context)!.save,
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

  bool isCountryInList(String countryName, List<Country> countryList) {
    // Find if any country in the list has the same name (case-insensitive)
    return countryList.any(
        (country) => country.name?.toLowerCase() == countryName.toLowerCase());
  }
}
