import 'package:ramadantimes/src/models/timing/timing.dart';

enum HomeStatus { initial, success, failure }

class HomeState {
  HomeState({
    this.status = HomeStatus.initial,
    this.timeOfToday,
    this.timeOfNextDay,
  });

  final HomeStatus status;
  final Timing? timeOfToday;
  final Timing? timeOfNextDay;

  HomeState copyWith({
    HomeStatus? status,
    Timing? timeOfToday,
    Timing? timeOfNextDay,
  }) {
    return HomeState(
      status: status ?? this.status,
      timeOfToday: timeOfToday ?? this.timeOfToday,
      timeOfNextDay: timeOfNextDay ?? this.timeOfNextDay,
    );
  }

  @override
  String toString() {
    return '''productState { status: $status, data: $timeOfToday,}''';
  }

  List<Object> get props => [status, timeOfToday!];
}
