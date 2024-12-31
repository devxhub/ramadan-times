import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ramadantimes/src/prayer_times/presentation/bloc/prayer_time_bloc.dart';
import 'package:ramadantimes/src/services/responsive_service.dart';

class UserLocation extends StatefulWidget {
  const UserLocation({super.key});

  @override
  State<UserLocation> createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(right: 8.0.w),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push('/location_select');
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.userCoordinator.userCity ?? "",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            //height: 1,
                            fontWeight: FontWeight.w700,
                            fontSize: isLargeScreen ? 10.5.sp : 7.sp,
                            color: Colors.black,
                          ),
                    ),
                    Text(
                      state.userCoordinator.userCountry ?? "",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            //height: 1,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 4.w,
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
