import 'package:ramadantimes/src/models/timing/timing.dart';
import 'package:ramadantimes/src/models/weather/weather_model_final.dart';

enum HomeStatus { initial, success, failure, noData }

class HomeState {
  HomeState({
    this.status = HomeStatus.initial,
    this.timeOfToday,
    this.timeOfNextDay,
    this.weatherData,
  });

  final HomeStatus status;
  final Timing? timeOfToday;
  final Timing? timeOfNextDay;
  final Main? weatherData;

  HomeState copyWith({
    HomeStatus? status,
    Timing? timeOfToday,
    Timing? timeOfNextDay,
    Main? weatherData,
  }) {
    return HomeState(
      status: status ?? this.status,
      timeOfToday: timeOfToday ?? this.timeOfToday,
      timeOfNextDay: timeOfNextDay ?? this.timeOfNextDay,
      weatherData: weatherData??this.weatherData,
    );
  }

  @override
  String toString() {
    return '''productState { status: $status, data: $timeOfToday,}''';
  }

  List<Object> get props => [status, timeOfToday!,];
}
