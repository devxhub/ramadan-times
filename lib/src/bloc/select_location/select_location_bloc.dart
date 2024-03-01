import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/address/district.dart';
import '../../services/location_repository.dart';

part 'select_location_event.dart';
part 'select_location_state.dart';
part 'select_location_bloc.freezed.dart';

class SelectLocationBloc
    extends Bloc<SelectLocationEvent, SelectLocationState> {
  final LocationRepository locationRepository;

  SelectLocationBloc({required this.locationRepository})
      : super(const _SelectLocationState()) {
    on<SelectLocationEvent>((events, emit) async {
      await events.map(
        dataLoaded: (event) async => await _dataLoaded(event, emit),
        locationLoaded: (event) async => await _locationLoaded(event, emit),
      );
    });
  }

  _dataLoaded(_DataLoaded event, Emitter<SelectLocationState> emit) async {
    try {
      final District districtResponse =
      await locationRepository.getDistrictData();

      emit(state.copyWith(
        districtList: [districtResponse],
        status: SelectLocationStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: SelectLocationStatus.failure));
    }
  }

  _locationLoaded(_LocationLoaded event,
      Emitter<SelectLocationState> emit) async {
  }

}