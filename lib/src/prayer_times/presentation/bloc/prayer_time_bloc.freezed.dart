// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer_time_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PrayerTimeEvent {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude)
        prayerTimesDataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? prayerTimesDataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? prayerTimesDataLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PrayerTimesDataLoaded value)
        prayerTimesDataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrayerTimeEventCopyWith<PrayerTimeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerTimeEventCopyWith<$Res> {
  factory $PrayerTimeEventCopyWith(
          PrayerTimeEvent value, $Res Function(PrayerTimeEvent) then) =
      _$PrayerTimeEventCopyWithImpl<$Res, PrayerTimeEvent>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$PrayerTimeEventCopyWithImpl<$Res, $Val extends PrayerTimeEvent>
    implements $PrayerTimeEventCopyWith<$Res> {
  _$PrayerTimeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrayerTimesDataLoadedImplCopyWith<$Res>
    implements $PrayerTimeEventCopyWith<$Res> {
  factory _$$PrayerTimesDataLoadedImplCopyWith(
          _$PrayerTimesDataLoadedImpl value,
          $Res Function(_$PrayerTimesDataLoadedImpl) then) =
      __$$PrayerTimesDataLoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$PrayerTimesDataLoadedImplCopyWithImpl<$Res>
    extends _$PrayerTimeEventCopyWithImpl<$Res, _$PrayerTimesDataLoadedImpl>
    implements _$$PrayerTimesDataLoadedImplCopyWith<$Res> {
  __$$PrayerTimesDataLoadedImplCopyWithImpl(_$PrayerTimesDataLoadedImpl _value,
      $Res Function(_$PrayerTimesDataLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$PrayerTimesDataLoadedImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PrayerTimesDataLoadedImpl
    with DiagnosticableTreeMixin
    implements _PrayerTimesDataLoaded {
  const _$PrayerTimesDataLoadedImpl(
      {required this.latitude, required this.longitude});

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimeEvent.prayerTimesDataLoaded(latitude: $latitude, longitude: $longitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'PrayerTimeEvent.prayerTimesDataLoaded'))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrayerTimesDataLoadedImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrayerTimesDataLoadedImplCopyWith<_$PrayerTimesDataLoadedImpl>
      get copyWith => __$$PrayerTimesDataLoadedImplCopyWithImpl<
          _$PrayerTimesDataLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude)
        prayerTimesDataLoaded,
  }) {
    return prayerTimesDataLoaded(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? prayerTimesDataLoaded,
  }) {
    return prayerTimesDataLoaded?.call(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? prayerTimesDataLoaded,
    required TResult orElse(),
  }) {
    if (prayerTimesDataLoaded != null) {
      return prayerTimesDataLoaded(latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PrayerTimesDataLoaded value)
        prayerTimesDataLoaded,
  }) {
    return prayerTimesDataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
  }) {
    return prayerTimesDataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    required TResult orElse(),
  }) {
    if (prayerTimesDataLoaded != null) {
      return prayerTimesDataLoaded(this);
    }
    return orElse();
  }
}

abstract class _PrayerTimesDataLoaded implements PrayerTimeEvent {
  const factory _PrayerTimesDataLoaded(
      {required final double latitude,
      required final double longitude}) = _$PrayerTimesDataLoadedImpl;

  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerTimesDataLoadedImplCopyWith<_$PrayerTimesDataLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PrayerTimeState {
  PrayerTimesResponse get prayerTimesResponse =>
      throw _privateConstructorUsedError;
  PrayerTimeStatus get prayerTimeStatus => throw _privateConstructorUsedError;

  /// Create a copy of PrayerTimeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrayerTimeStateCopyWith<PrayerTimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerTimeStateCopyWith<$Res> {
  factory $PrayerTimeStateCopyWith(
          PrayerTimeState value, $Res Function(PrayerTimeState) then) =
      _$PrayerTimeStateCopyWithImpl<$Res, PrayerTimeState>;
  @useResult
  $Res call(
      {PrayerTimesResponse prayerTimesResponse,
      PrayerTimeStatus prayerTimeStatus});
}

/// @nodoc
class _$PrayerTimeStateCopyWithImpl<$Res, $Val extends PrayerTimeState>
    implements $PrayerTimeStateCopyWith<$Res> {
  _$PrayerTimeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrayerTimeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prayerTimesResponse = null,
    Object? prayerTimeStatus = null,
  }) {
    return _then(_value.copyWith(
      prayerTimesResponse: null == prayerTimesResponse
          ? _value.prayerTimesResponse
          : prayerTimesResponse // ignore: cast_nullable_to_non_nullable
              as PrayerTimesResponse,
      prayerTimeStatus: null == prayerTimeStatus
          ? _value.prayerTimeStatus
          : prayerTimeStatus // ignore: cast_nullable_to_non_nullable
              as PrayerTimeStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrayerTimeStateImplCopyWith<$Res>
    implements $PrayerTimeStateCopyWith<$Res> {
  factory _$$PrayerTimeStateImplCopyWith(_$PrayerTimeStateImpl value,
          $Res Function(_$PrayerTimeStateImpl) then) =
      __$$PrayerTimeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PrayerTimesResponse prayerTimesResponse,
      PrayerTimeStatus prayerTimeStatus});
}

/// @nodoc
class __$$PrayerTimeStateImplCopyWithImpl<$Res>
    extends _$PrayerTimeStateCopyWithImpl<$Res, _$PrayerTimeStateImpl>
    implements _$$PrayerTimeStateImplCopyWith<$Res> {
  __$$PrayerTimeStateImplCopyWithImpl(
      _$PrayerTimeStateImpl _value, $Res Function(_$PrayerTimeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerTimeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prayerTimesResponse = null,
    Object? prayerTimeStatus = null,
  }) {
    return _then(_$PrayerTimeStateImpl(
      prayerTimesResponse: null == prayerTimesResponse
          ? _value.prayerTimesResponse
          : prayerTimesResponse // ignore: cast_nullable_to_non_nullable
              as PrayerTimesResponse,
      prayerTimeStatus: null == prayerTimeStatus
          ? _value.prayerTimeStatus
          : prayerTimeStatus // ignore: cast_nullable_to_non_nullable
              as PrayerTimeStatus,
    ));
  }
}

/// @nodoc

class _$PrayerTimeStateImpl
    with DiagnosticableTreeMixin
    implements _PrayerTimeState {
  const _$PrayerTimeStateImpl(
      {this.prayerTimesResponse = const PrayerTimesResponse(),
      this.prayerTimeStatus = PrayerTimeStatus.success});

  @override
  @JsonKey()
  final PrayerTimesResponse prayerTimesResponse;
  @override
  @JsonKey()
  final PrayerTimeStatus prayerTimeStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimeState(prayerTimesResponse: $prayerTimesResponse, prayerTimeStatus: $prayerTimeStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerTimeState'))
      ..add(DiagnosticsProperty('prayerTimesResponse', prayerTimesResponse))
      ..add(DiagnosticsProperty('prayerTimeStatus', prayerTimeStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrayerTimeStateImpl &&
            (identical(other.prayerTimesResponse, prayerTimesResponse) ||
                other.prayerTimesResponse == prayerTimesResponse) &&
            (identical(other.prayerTimeStatus, prayerTimeStatus) ||
                other.prayerTimeStatus == prayerTimeStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, prayerTimesResponse, prayerTimeStatus);

  /// Create a copy of PrayerTimeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrayerTimeStateImplCopyWith<_$PrayerTimeStateImpl> get copyWith =>
      __$$PrayerTimeStateImplCopyWithImpl<_$PrayerTimeStateImpl>(
          this, _$identity);
}

abstract class _PrayerTimeState implements PrayerTimeState {
  const factory _PrayerTimeState(
      {final PrayerTimesResponse prayerTimesResponse,
      final PrayerTimeStatus prayerTimeStatus}) = _$PrayerTimeStateImpl;

  @override
  PrayerTimesResponse get prayerTimesResponse;
  @override
  PrayerTimeStatus get prayerTimeStatus;

  /// Create a copy of PrayerTimeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerTimeStateImplCopyWith<_$PrayerTimeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
