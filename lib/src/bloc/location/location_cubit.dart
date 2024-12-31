import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslimtimespro/src/models/address/district.dart';
import 'package:muslimtimespro/src/services/api_service.dart';

import '../api_result.dart';
import '../network_exceptions.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState<List<District>>> {
  final ApiServices apiServices;

  LocationCubit({required this.apiServices}) : super(const Idle());

  loadData() async {
    emit(const LocationState.loading());

    ApiResult<List<District>> apiResult =
        await apiServices.fetchUpazilaByDistrictId();
    apiResult.when(
      success: (List<District> data) {
        emit(LocationState.data(data: data));
      },
      failure: (NetworkExceptions error) {
        emit(LocationState.error(error: error));
      },
    );
  }
}
