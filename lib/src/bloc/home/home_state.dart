import 'package:freezed_annotation/freezed_annotation.dart';

import '../network_exceptions.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.idle() = Idle<T>;

  const factory HomeState.loading() = Loading<T>;

  const factory HomeState.data({required T data}) = Data<T>;

  const factory HomeState.error({required NetworkExceptions error}) = Error<T>;
}
