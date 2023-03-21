import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ramadantimes/src/bloc/home/home_state.dart';
import 'package:ramadantimes/src/models/timing/timing.dart';
import 'package:ramadantimes/src/services/api_service.dart';

import '../api_result.dart';
import '../network_exceptions.dart';

class NextDayTimingCubit extends Cubit<HomeState<Timing>> {
  final ApiServices apiRepository;

  NextDayTimingCubit({required this.apiRepository}) : super(const Idle());

  loadNextData() async {
    emit(const HomeState.loading());
    ApiResult<Timing> apiResult = await apiRepository.timingsByCityCubit(
        date: DateFormat("dd-MM-yyyy").format(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 1)),
        city: "Dhaka",
        country: "Bangladesh",
        school: 1,
        method: 1);
    apiResult.when(
      success: (Timing data) {
        emit(HomeState.data(data: data));
      },
      failure: (NetworkExceptions error) {
        emit(HomeState.error(error: error));
      },
    );
  }
}
