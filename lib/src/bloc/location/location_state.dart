import 'package:freezed_annotation/freezed_annotation.dart';

import '../network_exceptions.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState<T> with _$LocationState<T> {
  const factory LocationState.idle() = Idle<T>;

  const factory LocationState.loading() = Loading<T>;

  const factory LocationState.data({required T data}) = Data<T>;

  const factory LocationState.error({required NetworkExceptions error}) =
      Error<T>;
}
