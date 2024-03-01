part of 'select_location_bloc.dart';
enum SelectLocationStatus { initial, success, failure }

@Freezed(copyWith: true, equal: true)
class SelectLocationState with _$SelectLocationState {
  const factory SelectLocationState({
    @Default(<District>[]) List<District> districtList,
    @Default(false) bool isLoading,
    @Default(SelectLocationStatus.initial) SelectLocationStatus status,
}) = _SelectLocationState;
}
