part of 'select_location_bloc.dart';

@freezed
class SelectLocationEvent with _$SelectLocationEvent {
  const factory SelectLocationEvent.dataLoaded() = _DataLoaded;
  const factory SelectLocationEvent.locationLoaded() = _LocationLoaded;
}
