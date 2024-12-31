import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:muslimtimespro/src/bloc/home/home_state.dart';
import 'package:muslimtimespro/src/models/timing/timing.dart';
import 'package:muslimtimespro/src/services/api_service.dart';

import '../api_result.dart';
import '../network_exceptions.dart';

class HomeCubit extends Cubit<HomeState<Timing>> {
  final ApiServices apiRepository;

  HomeCubit({required this.apiRepository}) : super(const Idle());

  loadData() async {
    emit(const HomeState.loading());
    print(
        "${DateTime.now()} >>>>>>>>>>>>>,.,.,.,.,.,><><><><><><><><><><><><><><><><><><><><><><><><><><<><><><>");
    ApiResult<Timing> apiResult = await apiRepository.timingsByCityCubit(
        date: DateFormat("dd-MM-yyyy").format(DateTime.now()),
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
