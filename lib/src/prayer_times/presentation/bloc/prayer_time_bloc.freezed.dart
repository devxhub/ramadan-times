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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude)
        prayerTimesDataLoaded,
    required TResult Function() countryDataLoaded,
    required TResult Function(BuildContext context) locationPermission,
    required TResult Function(BuildContext context, Country country)
        selectCountry,
    required TResult Function(BuildContext context, District district)
        selectCity,
    required TResult Function(
            BuildContext context, UserCoordinator userCoordinator)
        submitLocation,
    required TResult Function(BuildContext context, bool isDistrictSelected)
        isDistrictSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult? Function()? countryDataLoaded,
    TResult? Function(BuildContext context)? locationPermission,
    TResult? Function(BuildContext context, Country country)? selectCountry,
    TResult? Function(BuildContext context, District district)? selectCity,
    TResult? Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult? Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult Function()? countryDataLoaded,
    TResult Function(BuildContext context)? locationPermission,
    TResult Function(BuildContext context, Country country)? selectCountry,
    TResult Function(BuildContext context, District district)? selectCity,
    TResult Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PrayerTimesDataLoaded value)
        prayerTimesDataLoaded,
    required TResult Function(_CountryDataLoaded value) countryDataLoaded,
    required TResult Function(_LocationPermission value) locationPermission,
    required TResult Function(_SelectCountry value) selectCountry,
    required TResult Function(_SelectCity value) selectCity,
    required TResult Function(_SubmitLocation value) submitLocation,
    required TResult Function(_IsDistrictSelected value) isDistrictSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult? Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult? Function(_LocationPermission value)? locationPermission,
    TResult? Function(_SelectCountry value)? selectCountry,
    TResult? Function(_SelectCity value)? selectCity,
    TResult? Function(_SubmitLocation value)? submitLocation,
    TResult? Function(_IsDistrictSelected value)? isDistrictSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult Function(_LocationPermission value)? locationPermission,
    TResult Function(_SelectCountry value)? selectCountry,
    TResult Function(_SelectCity value)? selectCity,
    TResult Function(_SubmitLocation value)? submitLocation,
    TResult Function(_IsDistrictSelected value)? isDistrictSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerTimeEventCopyWith<$Res> {
  factory $PrayerTimeEventCopyWith(
          PrayerTimeEvent value, $Res Function(PrayerTimeEvent) then) =
      _$PrayerTimeEventCopyWithImpl<$Res, PrayerTimeEvent>;
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
}

/// @nodoc
abstract class _$$PrayerTimesDataLoadedImplCopyWith<$Res> {
  factory _$$PrayerTimesDataLoadedImplCopyWith(
          _$PrayerTimesDataLoadedImpl value,
          $Res Function(_$PrayerTimesDataLoadedImpl) then) =
      __$$PrayerTimesDataLoadedImplCopyWithImpl<$Res>;
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
    required TResult Function() countryDataLoaded,
    required TResult Function(BuildContext context) locationPermission,
    required TResult Function(BuildContext context, Country country)
        selectCountry,
    required TResult Function(BuildContext context, District district)
        selectCity,
    required TResult Function(
            BuildContext context, UserCoordinator userCoordinator)
        submitLocation,
    required TResult Function(BuildContext context, bool isDistrictSelected)
        isDistrictSelected,
  }) {
    return prayerTimesDataLoaded(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult? Function()? countryDataLoaded,
    TResult? Function(BuildContext context)? locationPermission,
    TResult? Function(BuildContext context, Country country)? selectCountry,
    TResult? Function(BuildContext context, District district)? selectCity,
    TResult? Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult? Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
  }) {
    return prayerTimesDataLoaded?.call(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult Function()? countryDataLoaded,
    TResult Function(BuildContext context)? locationPermission,
    TResult Function(BuildContext context, Country country)? selectCountry,
    TResult Function(BuildContext context, District district)? selectCity,
    TResult Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
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
    required TResult Function(_CountryDataLoaded value) countryDataLoaded,
    required TResult Function(_LocationPermission value) locationPermission,
    required TResult Function(_SelectCountry value) selectCountry,
    required TResult Function(_SelectCity value) selectCity,
    required TResult Function(_SubmitLocation value) submitLocation,
    required TResult Function(_IsDistrictSelected value) isDistrictSelected,
  }) {
    return prayerTimesDataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult? Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult? Function(_LocationPermission value)? locationPermission,
    TResult? Function(_SelectCountry value)? selectCountry,
    TResult? Function(_SelectCity value)? selectCity,
    TResult? Function(_SubmitLocation value)? submitLocation,
    TResult? Function(_IsDistrictSelected value)? isDistrictSelected,
  }) {
    return prayerTimesDataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult Function(_LocationPermission value)? locationPermission,
    TResult Function(_SelectCountry value)? selectCountry,
    TResult Function(_SelectCity value)? selectCity,
    TResult Function(_SubmitLocation value)? submitLocation,
    TResult Function(_IsDistrictSelected value)? isDistrictSelected,
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

  double get latitude;
  double get longitude;

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerTimesDataLoadedImplCopyWith<_$PrayerTimesDataLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CountryDataLoadedImplCopyWith<$Res> {
  factory _$$CountryDataLoadedImplCopyWith(_$CountryDataLoadedImpl value,
          $Res Function(_$CountryDataLoadedImpl) then) =
      __$$CountryDataLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CountryDataLoadedImplCopyWithImpl<$Res>
    extends _$PrayerTimeEventCopyWithImpl<$Res, _$CountryDataLoadedImpl>
    implements _$$CountryDataLoadedImplCopyWith<$Res> {
  __$$CountryDataLoadedImplCopyWithImpl(_$CountryDataLoadedImpl _value,
      $Res Function(_$CountryDataLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CountryDataLoadedImpl
    with DiagnosticableTreeMixin
    implements _CountryDataLoaded {
  const _$CountryDataLoadedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimeEvent.countryDataLoaded()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'PrayerTimeEvent.countryDataLoaded'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CountryDataLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude)
        prayerTimesDataLoaded,
    required TResult Function() countryDataLoaded,
    required TResult Function(BuildContext context) locationPermission,
    required TResult Function(BuildContext context, Country country)
        selectCountry,
    required TResult Function(BuildContext context, District district)
        selectCity,
    required TResult Function(
            BuildContext context, UserCoordinator userCoordinator)
        submitLocation,
    required TResult Function(BuildContext context, bool isDistrictSelected)
        isDistrictSelected,
  }) {
    return countryDataLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult? Function()? countryDataLoaded,
    TResult? Function(BuildContext context)? locationPermission,
    TResult? Function(BuildContext context, Country country)? selectCountry,
    TResult? Function(BuildContext context, District district)? selectCity,
    TResult? Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult? Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
  }) {
    return countryDataLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult Function()? countryDataLoaded,
    TResult Function(BuildContext context)? locationPermission,
    TResult Function(BuildContext context, Country country)? selectCountry,
    TResult Function(BuildContext context, District district)? selectCity,
    TResult Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
    required TResult orElse(),
  }) {
    if (countryDataLoaded != null) {
      return countryDataLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PrayerTimesDataLoaded value)
        prayerTimesDataLoaded,
    required TResult Function(_CountryDataLoaded value) countryDataLoaded,
    required TResult Function(_LocationPermission value) locationPermission,
    required TResult Function(_SelectCountry value) selectCountry,
    required TResult Function(_SelectCity value) selectCity,
    required TResult Function(_SubmitLocation value) submitLocation,
    required TResult Function(_IsDistrictSelected value) isDistrictSelected,
  }) {
    return countryDataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult? Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult? Function(_LocationPermission value)? locationPermission,
    TResult? Function(_SelectCountry value)? selectCountry,
    TResult? Function(_SelectCity value)? selectCity,
    TResult? Function(_SubmitLocation value)? submitLocation,
    TResult? Function(_IsDistrictSelected value)? isDistrictSelected,
  }) {
    return countryDataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult Function(_LocationPermission value)? locationPermission,
    TResult Function(_SelectCountry value)? selectCountry,
    TResult Function(_SelectCity value)? selectCity,
    TResult Function(_SubmitLocation value)? submitLocation,
    TResult Function(_IsDistrictSelected value)? isDistrictSelected,
    required TResult orElse(),
  }) {
    if (countryDataLoaded != null) {
      return countryDataLoaded(this);
    }
    return orElse();
  }
}

abstract class _CountryDataLoaded implements PrayerTimeEvent {
  const factory _CountryDataLoaded() = _$CountryDataLoadedImpl;
}

/// @nodoc
abstract class _$$LocationPermissionImplCopyWith<$Res> {
  factory _$$LocationPermissionImplCopyWith(_$LocationPermissionImpl value,
          $Res Function(_$LocationPermissionImpl) then) =
      __$$LocationPermissionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$LocationPermissionImplCopyWithImpl<$Res>
    extends _$PrayerTimeEventCopyWithImpl<$Res, _$LocationPermissionImpl>
    implements _$$LocationPermissionImplCopyWith<$Res> {
  __$$LocationPermissionImplCopyWithImpl(_$LocationPermissionImpl _value,
      $Res Function(_$LocationPermissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$LocationPermissionImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$LocationPermissionImpl
    with DiagnosticableTreeMixin
    implements _LocationPermission {
  const _$LocationPermissionImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimeEvent.locationPermission(context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerTimeEvent.locationPermission'))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPermissionImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPermissionImplCopyWith<_$LocationPermissionImpl> get copyWith =>
      __$$LocationPermissionImplCopyWithImpl<_$LocationPermissionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude)
        prayerTimesDataLoaded,
    required TResult Function() countryDataLoaded,
    required TResult Function(BuildContext context) locationPermission,
    required TResult Function(BuildContext context, Country country)
        selectCountry,
    required TResult Function(BuildContext context, District district)
        selectCity,
    required TResult Function(
            BuildContext context, UserCoordinator userCoordinator)
        submitLocation,
    required TResult Function(BuildContext context, bool isDistrictSelected)
        isDistrictSelected,
  }) {
    return locationPermission(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult? Function()? countryDataLoaded,
    TResult? Function(BuildContext context)? locationPermission,
    TResult? Function(BuildContext context, Country country)? selectCountry,
    TResult? Function(BuildContext context, District district)? selectCity,
    TResult? Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult? Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
  }) {
    return locationPermission?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult Function()? countryDataLoaded,
    TResult Function(BuildContext context)? locationPermission,
    TResult Function(BuildContext context, Country country)? selectCountry,
    TResult Function(BuildContext context, District district)? selectCity,
    TResult Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
    required TResult orElse(),
  }) {
    if (locationPermission != null) {
      return locationPermission(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PrayerTimesDataLoaded value)
        prayerTimesDataLoaded,
    required TResult Function(_CountryDataLoaded value) countryDataLoaded,
    required TResult Function(_LocationPermission value) locationPermission,
    required TResult Function(_SelectCountry value) selectCountry,
    required TResult Function(_SelectCity value) selectCity,
    required TResult Function(_SubmitLocation value) submitLocation,
    required TResult Function(_IsDistrictSelected value) isDistrictSelected,
  }) {
    return locationPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult? Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult? Function(_LocationPermission value)? locationPermission,
    TResult? Function(_SelectCountry value)? selectCountry,
    TResult? Function(_SelectCity value)? selectCity,
    TResult? Function(_SubmitLocation value)? submitLocation,
    TResult? Function(_IsDistrictSelected value)? isDistrictSelected,
  }) {
    return locationPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult Function(_LocationPermission value)? locationPermission,
    TResult Function(_SelectCountry value)? selectCountry,
    TResult Function(_SelectCity value)? selectCity,
    TResult Function(_SubmitLocation value)? submitLocation,
    TResult Function(_IsDistrictSelected value)? isDistrictSelected,
    required TResult orElse(),
  }) {
    if (locationPermission != null) {
      return locationPermission(this);
    }
    return orElse();
  }
}

abstract class _LocationPermission implements PrayerTimeEvent {
  const factory _LocationPermission({required final BuildContext context}) =
      _$LocationPermissionImpl;

  BuildContext get context;

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationPermissionImplCopyWith<_$LocationPermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCountryImplCopyWith<$Res> {
  factory _$$SelectCountryImplCopyWith(
          _$SelectCountryImpl value, $Res Function(_$SelectCountryImpl) then) =
      __$$SelectCountryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, Country country});
}

/// @nodoc
class __$$SelectCountryImplCopyWithImpl<$Res>
    extends _$PrayerTimeEventCopyWithImpl<$Res, _$SelectCountryImpl>
    implements _$$SelectCountryImplCopyWith<$Res> {
  __$$SelectCountryImplCopyWithImpl(
      _$SelectCountryImpl _value, $Res Function(_$SelectCountryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? country = null,
  }) {
    return _then(_$SelectCountryImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
    ));
  }
}

/// @nodoc

class _$SelectCountryImpl
    with DiagnosticableTreeMixin
    implements _SelectCountry {
  const _$SelectCountryImpl({required this.context, required this.country});

  @override
  final BuildContext context;
  @override
  final Country country;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimeEvent.selectCountry(context: $context, country: $country)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerTimeEvent.selectCountry'))
      ..add(DiagnosticsProperty('context', context))
      ..add(DiagnosticsProperty('country', country));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCountryImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, country);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCountryImplCopyWith<_$SelectCountryImpl> get copyWith =>
      __$$SelectCountryImplCopyWithImpl<_$SelectCountryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude)
        prayerTimesDataLoaded,
    required TResult Function() countryDataLoaded,
    required TResult Function(BuildContext context) locationPermission,
    required TResult Function(BuildContext context, Country country)
        selectCountry,
    required TResult Function(BuildContext context, District district)
        selectCity,
    required TResult Function(
            BuildContext context, UserCoordinator userCoordinator)
        submitLocation,
    required TResult Function(BuildContext context, bool isDistrictSelected)
        isDistrictSelected,
  }) {
    return selectCountry(context, country);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult? Function()? countryDataLoaded,
    TResult? Function(BuildContext context)? locationPermission,
    TResult? Function(BuildContext context, Country country)? selectCountry,
    TResult? Function(BuildContext context, District district)? selectCity,
    TResult? Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult? Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
  }) {
    return selectCountry?.call(context, country);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult Function()? countryDataLoaded,
    TResult Function(BuildContext context)? locationPermission,
    TResult Function(BuildContext context, Country country)? selectCountry,
    TResult Function(BuildContext context, District district)? selectCity,
    TResult Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
    required TResult orElse(),
  }) {
    if (selectCountry != null) {
      return selectCountry(context, country);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PrayerTimesDataLoaded value)
        prayerTimesDataLoaded,
    required TResult Function(_CountryDataLoaded value) countryDataLoaded,
    required TResult Function(_LocationPermission value) locationPermission,
    required TResult Function(_SelectCountry value) selectCountry,
    required TResult Function(_SelectCity value) selectCity,
    required TResult Function(_SubmitLocation value) submitLocation,
    required TResult Function(_IsDistrictSelected value) isDistrictSelected,
  }) {
    return selectCountry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult? Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult? Function(_LocationPermission value)? locationPermission,
    TResult? Function(_SelectCountry value)? selectCountry,
    TResult? Function(_SelectCity value)? selectCity,
    TResult? Function(_SubmitLocation value)? submitLocation,
    TResult? Function(_IsDistrictSelected value)? isDistrictSelected,
  }) {
    return selectCountry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult Function(_LocationPermission value)? locationPermission,
    TResult Function(_SelectCountry value)? selectCountry,
    TResult Function(_SelectCity value)? selectCity,
    TResult Function(_SubmitLocation value)? submitLocation,
    TResult Function(_IsDistrictSelected value)? isDistrictSelected,
    required TResult orElse(),
  }) {
    if (selectCountry != null) {
      return selectCountry(this);
    }
    return orElse();
  }
}

abstract class _SelectCountry implements PrayerTimeEvent {
  const factory _SelectCountry(
      {required final BuildContext context,
      required final Country country}) = _$SelectCountryImpl;

  BuildContext get context;
  Country get country;

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectCountryImplCopyWith<_$SelectCountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCityImplCopyWith<$Res> {
  factory _$$SelectCityImplCopyWith(
          _$SelectCityImpl value, $Res Function(_$SelectCityImpl) then) =
      __$$SelectCityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, District district});
}

/// @nodoc
class __$$SelectCityImplCopyWithImpl<$Res>
    extends _$PrayerTimeEventCopyWithImpl<$Res, _$SelectCityImpl>
    implements _$$SelectCityImplCopyWith<$Res> {
  __$$SelectCityImplCopyWithImpl(
      _$SelectCityImpl _value, $Res Function(_$SelectCityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? district = null,
  }) {
    return _then(_$SelectCityImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District,
    ));
  }
}

/// @nodoc

class _$SelectCityImpl with DiagnosticableTreeMixin implements _SelectCity {
  const _$SelectCityImpl({required this.context, required this.district});

  @override
  final BuildContext context;
  @override
  final District district;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimeEvent.selectCity(context: $context, district: $district)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerTimeEvent.selectCity'))
      ..add(DiagnosticsProperty('context', context))
      ..add(DiagnosticsProperty('district', district));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCityImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.district, district) ||
                other.district == district));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, district);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCityImplCopyWith<_$SelectCityImpl> get copyWith =>
      __$$SelectCityImplCopyWithImpl<_$SelectCityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude)
        prayerTimesDataLoaded,
    required TResult Function() countryDataLoaded,
    required TResult Function(BuildContext context) locationPermission,
    required TResult Function(BuildContext context, Country country)
        selectCountry,
    required TResult Function(BuildContext context, District district)
        selectCity,
    required TResult Function(
            BuildContext context, UserCoordinator userCoordinator)
        submitLocation,
    required TResult Function(BuildContext context, bool isDistrictSelected)
        isDistrictSelected,
  }) {
    return selectCity(context, district);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult? Function()? countryDataLoaded,
    TResult? Function(BuildContext context)? locationPermission,
    TResult? Function(BuildContext context, Country country)? selectCountry,
    TResult? Function(BuildContext context, District district)? selectCity,
    TResult? Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult? Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
  }) {
    return selectCity?.call(context, district);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult Function()? countryDataLoaded,
    TResult Function(BuildContext context)? locationPermission,
    TResult Function(BuildContext context, Country country)? selectCountry,
    TResult Function(BuildContext context, District district)? selectCity,
    TResult Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
    required TResult orElse(),
  }) {
    if (selectCity != null) {
      return selectCity(context, district);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PrayerTimesDataLoaded value)
        prayerTimesDataLoaded,
    required TResult Function(_CountryDataLoaded value) countryDataLoaded,
    required TResult Function(_LocationPermission value) locationPermission,
    required TResult Function(_SelectCountry value) selectCountry,
    required TResult Function(_SelectCity value) selectCity,
    required TResult Function(_SubmitLocation value) submitLocation,
    required TResult Function(_IsDistrictSelected value) isDistrictSelected,
  }) {
    return selectCity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult? Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult? Function(_LocationPermission value)? locationPermission,
    TResult? Function(_SelectCountry value)? selectCountry,
    TResult? Function(_SelectCity value)? selectCity,
    TResult? Function(_SubmitLocation value)? submitLocation,
    TResult? Function(_IsDistrictSelected value)? isDistrictSelected,
  }) {
    return selectCity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult Function(_LocationPermission value)? locationPermission,
    TResult Function(_SelectCountry value)? selectCountry,
    TResult Function(_SelectCity value)? selectCity,
    TResult Function(_SubmitLocation value)? submitLocation,
    TResult Function(_IsDistrictSelected value)? isDistrictSelected,
    required TResult orElse(),
  }) {
    if (selectCity != null) {
      return selectCity(this);
    }
    return orElse();
  }
}

abstract class _SelectCity implements PrayerTimeEvent {
  const factory _SelectCity(
      {required final BuildContext context,
      required final District district}) = _$SelectCityImpl;

  BuildContext get context;
  District get district;

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectCityImplCopyWith<_$SelectCityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitLocationImplCopyWith<$Res> {
  factory _$$SubmitLocationImplCopyWith(_$SubmitLocationImpl value,
          $Res Function(_$SubmitLocationImpl) then) =
      __$$SubmitLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, UserCoordinator userCoordinator});
}

/// @nodoc
class __$$SubmitLocationImplCopyWithImpl<$Res>
    extends _$PrayerTimeEventCopyWithImpl<$Res, _$SubmitLocationImpl>
    implements _$$SubmitLocationImplCopyWith<$Res> {
  __$$SubmitLocationImplCopyWithImpl(
      _$SubmitLocationImpl _value, $Res Function(_$SubmitLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? userCoordinator = null,
  }) {
    return _then(_$SubmitLocationImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      userCoordinator: null == userCoordinator
          ? _value.userCoordinator
          : userCoordinator // ignore: cast_nullable_to_non_nullable
              as UserCoordinator,
    ));
  }
}

/// @nodoc

class _$SubmitLocationImpl
    with DiagnosticableTreeMixin
    implements _SubmitLocation {
  const _$SubmitLocationImpl(
      {required this.context, required this.userCoordinator});

  @override
  final BuildContext context;
  @override
  final UserCoordinator userCoordinator;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimeEvent.submitLocation(context: $context, userCoordinator: $userCoordinator)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerTimeEvent.submitLocation'))
      ..add(DiagnosticsProperty('context', context))
      ..add(DiagnosticsProperty('userCoordinator', userCoordinator));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitLocationImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.userCoordinator, userCoordinator) ||
                other.userCoordinator == userCoordinator));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, userCoordinator);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitLocationImplCopyWith<_$SubmitLocationImpl> get copyWith =>
      __$$SubmitLocationImplCopyWithImpl<_$SubmitLocationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude)
        prayerTimesDataLoaded,
    required TResult Function() countryDataLoaded,
    required TResult Function(BuildContext context) locationPermission,
    required TResult Function(BuildContext context, Country country)
        selectCountry,
    required TResult Function(BuildContext context, District district)
        selectCity,
    required TResult Function(
            BuildContext context, UserCoordinator userCoordinator)
        submitLocation,
    required TResult Function(BuildContext context, bool isDistrictSelected)
        isDistrictSelected,
  }) {
    return submitLocation(context, userCoordinator);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult? Function()? countryDataLoaded,
    TResult? Function(BuildContext context)? locationPermission,
    TResult? Function(BuildContext context, Country country)? selectCountry,
    TResult? Function(BuildContext context, District district)? selectCity,
    TResult? Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult? Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
  }) {
    return submitLocation?.call(context, userCoordinator);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult Function()? countryDataLoaded,
    TResult Function(BuildContext context)? locationPermission,
    TResult Function(BuildContext context, Country country)? selectCountry,
    TResult Function(BuildContext context, District district)? selectCity,
    TResult Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
    required TResult orElse(),
  }) {
    if (submitLocation != null) {
      return submitLocation(context, userCoordinator);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PrayerTimesDataLoaded value)
        prayerTimesDataLoaded,
    required TResult Function(_CountryDataLoaded value) countryDataLoaded,
    required TResult Function(_LocationPermission value) locationPermission,
    required TResult Function(_SelectCountry value) selectCountry,
    required TResult Function(_SelectCity value) selectCity,
    required TResult Function(_SubmitLocation value) submitLocation,
    required TResult Function(_IsDistrictSelected value) isDistrictSelected,
  }) {
    return submitLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult? Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult? Function(_LocationPermission value)? locationPermission,
    TResult? Function(_SelectCountry value)? selectCountry,
    TResult? Function(_SelectCity value)? selectCity,
    TResult? Function(_SubmitLocation value)? submitLocation,
    TResult? Function(_IsDistrictSelected value)? isDistrictSelected,
  }) {
    return submitLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult Function(_LocationPermission value)? locationPermission,
    TResult Function(_SelectCountry value)? selectCountry,
    TResult Function(_SelectCity value)? selectCity,
    TResult Function(_SubmitLocation value)? submitLocation,
    TResult Function(_IsDistrictSelected value)? isDistrictSelected,
    required TResult orElse(),
  }) {
    if (submitLocation != null) {
      return submitLocation(this);
    }
    return orElse();
  }
}

abstract class _SubmitLocation implements PrayerTimeEvent {
  const factory _SubmitLocation(
      {required final BuildContext context,
      required final UserCoordinator userCoordinator}) = _$SubmitLocationImpl;

  BuildContext get context;
  UserCoordinator get userCoordinator;

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitLocationImplCopyWith<_$SubmitLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsDistrictSelectedImplCopyWith<$Res> {
  factory _$$IsDistrictSelectedImplCopyWith(_$IsDistrictSelectedImpl value,
          $Res Function(_$IsDistrictSelectedImpl) then) =
      __$$IsDistrictSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, bool isDistrictSelected});
}

/// @nodoc
class __$$IsDistrictSelectedImplCopyWithImpl<$Res>
    extends _$PrayerTimeEventCopyWithImpl<$Res, _$IsDistrictSelectedImpl>
    implements _$$IsDistrictSelectedImplCopyWith<$Res> {
  __$$IsDistrictSelectedImplCopyWithImpl(_$IsDistrictSelectedImpl _value,
      $Res Function(_$IsDistrictSelectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isDistrictSelected = null,
  }) {
    return _then(_$IsDistrictSelectedImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      isDistrictSelected: null == isDistrictSelected
          ? _value.isDistrictSelected
          : isDistrictSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsDistrictSelectedImpl
    with DiagnosticableTreeMixin
    implements _IsDistrictSelected {
  const _$IsDistrictSelectedImpl(
      {required this.context, required this.isDistrictSelected});

  @override
  final BuildContext context;
  @override
  final bool isDistrictSelected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimeEvent.isDistrictSelected(context: $context, isDistrictSelected: $isDistrictSelected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerTimeEvent.isDistrictSelected'))
      ..add(DiagnosticsProperty('context', context))
      ..add(DiagnosticsProperty('isDistrictSelected', isDistrictSelected));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsDistrictSelectedImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isDistrictSelected, isDistrictSelected) ||
                other.isDistrictSelected == isDistrictSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, isDistrictSelected);

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IsDistrictSelectedImplCopyWith<_$IsDistrictSelectedImpl> get copyWith =>
      __$$IsDistrictSelectedImplCopyWithImpl<_$IsDistrictSelectedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude)
        prayerTimesDataLoaded,
    required TResult Function() countryDataLoaded,
    required TResult Function(BuildContext context) locationPermission,
    required TResult Function(BuildContext context, Country country)
        selectCountry,
    required TResult Function(BuildContext context, District district)
        selectCity,
    required TResult Function(
            BuildContext context, UserCoordinator userCoordinator)
        submitLocation,
    required TResult Function(BuildContext context, bool isDistrictSelected)
        isDistrictSelected,
  }) {
    return isDistrictSelected(context, this.isDistrictSelected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult? Function()? countryDataLoaded,
    TResult? Function(BuildContext context)? locationPermission,
    TResult? Function(BuildContext context, Country country)? selectCountry,
    TResult? Function(BuildContext context, District district)? selectCity,
    TResult? Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult? Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
  }) {
    return isDistrictSelected?.call(context, this.isDistrictSelected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? prayerTimesDataLoaded,
    TResult Function()? countryDataLoaded,
    TResult Function(BuildContext context)? locationPermission,
    TResult Function(BuildContext context, Country country)? selectCountry,
    TResult Function(BuildContext context, District district)? selectCity,
    TResult Function(BuildContext context, UserCoordinator userCoordinator)?
        submitLocation,
    TResult Function(BuildContext context, bool isDistrictSelected)?
        isDistrictSelected,
    required TResult orElse(),
  }) {
    if (isDistrictSelected != null) {
      return isDistrictSelected(context, this.isDistrictSelected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PrayerTimesDataLoaded value)
        prayerTimesDataLoaded,
    required TResult Function(_CountryDataLoaded value) countryDataLoaded,
    required TResult Function(_LocationPermission value) locationPermission,
    required TResult Function(_SelectCountry value) selectCountry,
    required TResult Function(_SelectCity value) selectCity,
    required TResult Function(_SubmitLocation value) submitLocation,
    required TResult Function(_IsDistrictSelected value) isDistrictSelected,
  }) {
    return isDistrictSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult? Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult? Function(_LocationPermission value)? locationPermission,
    TResult? Function(_SelectCountry value)? selectCountry,
    TResult? Function(_SelectCity value)? selectCity,
    TResult? Function(_SubmitLocation value)? submitLocation,
    TResult? Function(_IsDistrictSelected value)? isDistrictSelected,
  }) {
    return isDistrictSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrayerTimesDataLoaded value)? prayerTimesDataLoaded,
    TResult Function(_CountryDataLoaded value)? countryDataLoaded,
    TResult Function(_LocationPermission value)? locationPermission,
    TResult Function(_SelectCountry value)? selectCountry,
    TResult Function(_SelectCity value)? selectCity,
    TResult Function(_SubmitLocation value)? submitLocation,
    TResult Function(_IsDistrictSelected value)? isDistrictSelected,
    required TResult orElse(),
  }) {
    if (isDistrictSelected != null) {
      return isDistrictSelected(this);
    }
    return orElse();
  }
}

abstract class _IsDistrictSelected implements PrayerTimeEvent {
  const factory _IsDistrictSelected(
      {required final BuildContext context,
      required final bool isDistrictSelected}) = _$IsDistrictSelectedImpl;

  BuildContext get context;
  bool get isDistrictSelected;

  /// Create a copy of PrayerTimeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IsDistrictSelectedImplCopyWith<_$IsDistrictSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PrayerTimeState {
  PrayerTimesResponse get prayerTimesResponse =>
      throw _privateConstructorUsedError;
  CountryResponse get countryResponse => throw _privateConstructorUsedError;
  UserCoordinator get userCoordinator => throw _privateConstructorUsedError;
  Country? get selectedCountry => throw _privateConstructorUsedError;
  District? get selectedDistrict => throw _privateConstructorUsedError;
  bool get isDistrictSelected => throw _privateConstructorUsedError;
  PrayerTimeStatus get prayerTimeStatus => throw _privateConstructorUsedError;
  PrayerStatus get prayerStatus => throw _privateConstructorUsedError;

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
      CountryResponse countryResponse,
      UserCoordinator userCoordinator,
      Country? selectedCountry,
      District? selectedDistrict,
      bool isDistrictSelected,
      PrayerTimeStatus prayerTimeStatus,
      PrayerStatus prayerStatus});
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
    Object? countryResponse = null,
    Object? userCoordinator = null,
    Object? selectedCountry = freezed,
    Object? selectedDistrict = freezed,
    Object? isDistrictSelected = null,
    Object? prayerTimeStatus = null,
    Object? prayerStatus = null,
  }) {
    return _then(_value.copyWith(
      prayerTimesResponse: null == prayerTimesResponse
          ? _value.prayerTimesResponse
          : prayerTimesResponse // ignore: cast_nullable_to_non_nullable
              as PrayerTimesResponse,
      countryResponse: null == countryResponse
          ? _value.countryResponse
          : countryResponse // ignore: cast_nullable_to_non_nullable
              as CountryResponse,
      userCoordinator: null == userCoordinator
          ? _value.userCoordinator
          : userCoordinator // ignore: cast_nullable_to_non_nullable
              as UserCoordinator,
      selectedCountry: freezed == selectedCountry
          ? _value.selectedCountry
          : selectedCountry // ignore: cast_nullable_to_non_nullable
              as Country?,
      selectedDistrict: freezed == selectedDistrict
          ? _value.selectedDistrict
          : selectedDistrict // ignore: cast_nullable_to_non_nullable
              as District?,
      isDistrictSelected: null == isDistrictSelected
          ? _value.isDistrictSelected
          : isDistrictSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      prayerTimeStatus: null == prayerTimeStatus
          ? _value.prayerTimeStatus
          : prayerTimeStatus // ignore: cast_nullable_to_non_nullable
              as PrayerTimeStatus,
      prayerStatus: null == prayerStatus
          ? _value.prayerStatus
          : prayerStatus // ignore: cast_nullable_to_non_nullable
              as PrayerStatus,
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
      CountryResponse countryResponse,
      UserCoordinator userCoordinator,
      Country? selectedCountry,
      District? selectedDistrict,
      bool isDistrictSelected,
      PrayerTimeStatus prayerTimeStatus,
      PrayerStatus prayerStatus});
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
    Object? countryResponse = null,
    Object? userCoordinator = null,
    Object? selectedCountry = freezed,
    Object? selectedDistrict = freezed,
    Object? isDistrictSelected = null,
    Object? prayerTimeStatus = null,
    Object? prayerStatus = null,
  }) {
    return _then(_$PrayerTimeStateImpl(
      prayerTimesResponse: null == prayerTimesResponse
          ? _value.prayerTimesResponse
          : prayerTimesResponse // ignore: cast_nullable_to_non_nullable
              as PrayerTimesResponse,
      countryResponse: null == countryResponse
          ? _value.countryResponse
          : countryResponse // ignore: cast_nullable_to_non_nullable
              as CountryResponse,
      userCoordinator: null == userCoordinator
          ? _value.userCoordinator
          : userCoordinator // ignore: cast_nullable_to_non_nullable
              as UserCoordinator,
      selectedCountry: freezed == selectedCountry
          ? _value.selectedCountry
          : selectedCountry // ignore: cast_nullable_to_non_nullable
              as Country?,
      selectedDistrict: freezed == selectedDistrict
          ? _value.selectedDistrict
          : selectedDistrict // ignore: cast_nullable_to_non_nullable
              as District?,
      isDistrictSelected: null == isDistrictSelected
          ? _value.isDistrictSelected
          : isDistrictSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      prayerTimeStatus: null == prayerTimeStatus
          ? _value.prayerTimeStatus
          : prayerTimeStatus // ignore: cast_nullable_to_non_nullable
              as PrayerTimeStatus,
      prayerStatus: null == prayerStatus
          ? _value.prayerStatus
          : prayerStatus // ignore: cast_nullable_to_non_nullable
              as PrayerStatus,
    ));
  }
}

/// @nodoc

class _$PrayerTimeStateImpl
    with DiagnosticableTreeMixin
    implements _PrayerTimeState {
  const _$PrayerTimeStateImpl(
      {this.prayerTimesResponse = const PrayerTimesResponse(),
      this.countryResponse = const CountryResponse(),
      this.userCoordinator = const UserCoordinator(),
      this.selectedCountry,
      this.selectedDistrict,
      this.isDistrictSelected = true,
      this.prayerTimeStatus = PrayerTimeStatus.success,
      this.prayerStatus = PrayerStatus.success});

  @override
  @JsonKey()
  final PrayerTimesResponse prayerTimesResponse;
  @override
  @JsonKey()
  final CountryResponse countryResponse;
  @override
  @JsonKey()
  final UserCoordinator userCoordinator;
  @override
  final Country? selectedCountry;
  @override
  final District? selectedDistrict;
  @override
  @JsonKey()
  final bool isDistrictSelected;
  @override
  @JsonKey()
  final PrayerTimeStatus prayerTimeStatus;
  @override
  @JsonKey()
  final PrayerStatus prayerStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimeState(prayerTimesResponse: $prayerTimesResponse, countryResponse: $countryResponse, userCoordinator: $userCoordinator, selectedCountry: $selectedCountry, selectedDistrict: $selectedDistrict, isDistrictSelected: $isDistrictSelected, prayerTimeStatus: $prayerTimeStatus, prayerStatus: $prayerStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerTimeState'))
      ..add(DiagnosticsProperty('prayerTimesResponse', prayerTimesResponse))
      ..add(DiagnosticsProperty('countryResponse', countryResponse))
      ..add(DiagnosticsProperty('userCoordinator', userCoordinator))
      ..add(DiagnosticsProperty('selectedCountry', selectedCountry))
      ..add(DiagnosticsProperty('selectedDistrict', selectedDistrict))
      ..add(DiagnosticsProperty('isDistrictSelected', isDistrictSelected))
      ..add(DiagnosticsProperty('prayerTimeStatus', prayerTimeStatus))
      ..add(DiagnosticsProperty('prayerStatus', prayerStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrayerTimeStateImpl &&
            (identical(other.prayerTimesResponse, prayerTimesResponse) ||
                other.prayerTimesResponse == prayerTimesResponse) &&
            (identical(other.countryResponse, countryResponse) ||
                other.countryResponse == countryResponse) &&
            (identical(other.userCoordinator, userCoordinator) ||
                other.userCoordinator == userCoordinator) &&
            (identical(other.selectedCountry, selectedCountry) ||
                other.selectedCountry == selectedCountry) &&
            (identical(other.selectedDistrict, selectedDistrict) ||
                other.selectedDistrict == selectedDistrict) &&
            (identical(other.isDistrictSelected, isDistrictSelected) ||
                other.isDistrictSelected == isDistrictSelected) &&
            (identical(other.prayerTimeStatus, prayerTimeStatus) ||
                other.prayerTimeStatus == prayerTimeStatus) &&
            (identical(other.prayerStatus, prayerStatus) ||
                other.prayerStatus == prayerStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      prayerTimesResponse,
      countryResponse,
      userCoordinator,
      selectedCountry,
      selectedDistrict,
      isDistrictSelected,
      prayerTimeStatus,
      prayerStatus);

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
      final CountryResponse countryResponse,
      final UserCoordinator userCoordinator,
      final Country? selectedCountry,
      final District? selectedDistrict,
      final bool isDistrictSelected,
      final PrayerTimeStatus prayerTimeStatus,
      final PrayerStatus prayerStatus}) = _$PrayerTimeStateImpl;

  @override
  PrayerTimesResponse get prayerTimesResponse;
  @override
  CountryResponse get countryResponse;
  @override
  UserCoordinator get userCoordinator;
  @override
  Country? get selectedCountry;
  @override
  District? get selectedDistrict;
  @override
  bool get isDistrictSelected;
  @override
  PrayerTimeStatus get prayerTimeStatus;
  @override
  PrayerStatus get prayerStatus;

  /// Create a copy of PrayerTimeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerTimeStateImplCopyWith<_$PrayerTimeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
