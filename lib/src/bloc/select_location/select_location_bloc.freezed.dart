// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectLocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() dataLoaded,
    required TResult Function() locationLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? dataLoaded,
    TResult? Function()? locationLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? dataLoaded,
    TResult Function()? locationLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_LocationLoaded value) locationLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_LocationLoaded value)? locationLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_LocationLoaded value)? locationLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectLocationEventCopyWith<$Res> {
  factory $SelectLocationEventCopyWith(
          SelectLocationEvent value, $Res Function(SelectLocationEvent) then) =
      _$SelectLocationEventCopyWithImpl<$Res, SelectLocationEvent>;
}

/// @nodoc
class _$SelectLocationEventCopyWithImpl<$Res, $Val extends SelectLocationEvent>
    implements $SelectLocationEventCopyWith<$Res> {
  _$SelectLocationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DataLoadedImplCopyWith<$Res> {
  factory _$$DataLoadedImplCopyWith(
          _$DataLoadedImpl value, $Res Function(_$DataLoadedImpl) then) =
      __$$DataLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DataLoadedImplCopyWithImpl<$Res>
    extends _$SelectLocationEventCopyWithImpl<$Res, _$DataLoadedImpl>
    implements _$$DataLoadedImplCopyWith<$Res> {
  __$$DataLoadedImplCopyWithImpl(
      _$DataLoadedImpl _value, $Res Function(_$DataLoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DataLoadedImpl implements _DataLoaded {
  const _$DataLoadedImpl();

  @override
  String toString() {
    return 'SelectLocationEvent.dataLoaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DataLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() dataLoaded,
    required TResult Function() locationLoaded,
  }) {
    return dataLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? dataLoaded,
    TResult? Function()? locationLoaded,
  }) {
    return dataLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? dataLoaded,
    TResult Function()? locationLoaded,
    required TResult orElse(),
  }) {
    if (dataLoaded != null) {
      return dataLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_LocationLoaded value) locationLoaded,
  }) {
    return dataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_LocationLoaded value)? locationLoaded,
  }) {
    return dataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_LocationLoaded value)? locationLoaded,
    required TResult orElse(),
  }) {
    if (dataLoaded != null) {
      return dataLoaded(this);
    }
    return orElse();
  }
}

abstract class _DataLoaded implements SelectLocationEvent {
  const factory _DataLoaded() = _$DataLoadedImpl;
}

/// @nodoc
abstract class _$$LocationLoadedImplCopyWith<$Res> {
  factory _$$LocationLoadedImplCopyWith(_$LocationLoadedImpl value,
          $Res Function(_$LocationLoadedImpl) then) =
      __$$LocationLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocationLoadedImplCopyWithImpl<$Res>
    extends _$SelectLocationEventCopyWithImpl<$Res, _$LocationLoadedImpl>
    implements _$$LocationLoadedImplCopyWith<$Res> {
  __$$LocationLoadedImplCopyWithImpl(
      _$LocationLoadedImpl _value, $Res Function(_$LocationLoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LocationLoadedImpl implements _LocationLoaded {
  const _$LocationLoadedImpl();

  @override
  String toString() {
    return 'SelectLocationEvent.locationLoaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LocationLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() dataLoaded,
    required TResult Function() locationLoaded,
  }) {
    return locationLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? dataLoaded,
    TResult? Function()? locationLoaded,
  }) {
    return locationLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? dataLoaded,
    TResult Function()? locationLoaded,
    required TResult orElse(),
  }) {
    if (locationLoaded != null) {
      return locationLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataLoaded value) dataLoaded,
    required TResult Function(_LocationLoaded value) locationLoaded,
  }) {
    return locationLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DataLoaded value)? dataLoaded,
    TResult? Function(_LocationLoaded value)? locationLoaded,
  }) {
    return locationLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataLoaded value)? dataLoaded,
    TResult Function(_LocationLoaded value)? locationLoaded,
    required TResult orElse(),
  }) {
    if (locationLoaded != null) {
      return locationLoaded(this);
    }
    return orElse();
  }
}

abstract class _LocationLoaded implements SelectLocationEvent {
  const factory _LocationLoaded() = _$LocationLoadedImpl;
}

/// @nodoc
mixin _$SelectLocationState {
  List<District> get districtList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  SelectLocationStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectLocationStateCopyWith<SelectLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectLocationStateCopyWith<$Res> {
  factory $SelectLocationStateCopyWith(
          SelectLocationState value, $Res Function(SelectLocationState) then) =
      _$SelectLocationStateCopyWithImpl<$Res, SelectLocationState>;
  @useResult
  $Res call(
      {List<District> districtList,
      bool isLoading,
      SelectLocationStatus status});
}

/// @nodoc
class _$SelectLocationStateCopyWithImpl<$Res, $Val extends SelectLocationState>
    implements $SelectLocationStateCopyWith<$Res> {
  _$SelectLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtList = null,
    Object? isLoading = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      districtList: null == districtList
          ? _value.districtList
          : districtList // ignore: cast_nullable_to_non_nullable
              as List<District>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SelectLocationStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectLocationStateImplCopyWith<$Res>
    implements $SelectLocationStateCopyWith<$Res> {
  factory _$$SelectLocationStateImplCopyWith(_$SelectLocationStateImpl value,
          $Res Function(_$SelectLocationStateImpl) then) =
      __$$SelectLocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<District> districtList,
      bool isLoading,
      SelectLocationStatus status});
}

/// @nodoc
class __$$SelectLocationStateImplCopyWithImpl<$Res>
    extends _$SelectLocationStateCopyWithImpl<$Res, _$SelectLocationStateImpl>
    implements _$$SelectLocationStateImplCopyWith<$Res> {
  __$$SelectLocationStateImplCopyWithImpl(_$SelectLocationStateImpl _value,
      $Res Function(_$SelectLocationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtList = null,
    Object? isLoading = null,
    Object? status = null,
  }) {
    return _then(_$SelectLocationStateImpl(
      districtList: null == districtList
          ? _value._districtList
          : districtList // ignore: cast_nullable_to_non_nullable
              as List<District>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SelectLocationStatus,
    ));
  }
}

/// @nodoc

class _$SelectLocationStateImpl implements _SelectLocationState {
  const _$SelectLocationStateImpl(
      {final List<District> districtList = const <District>[],
      this.isLoading = false,
      this.status = SelectLocationStatus.initial})
      : _districtList = districtList;

  final List<District> _districtList;
  @override
  @JsonKey()
  List<District> get districtList {
    if (_districtList is EqualUnmodifiableListView) return _districtList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_districtList);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final SelectLocationStatus status;

  @override
  String toString() {
    return 'SelectLocationState(districtList: $districtList, isLoading: $isLoading, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectLocationStateImpl &&
            const DeepCollectionEquality()
                .equals(other._districtList, _districtList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_districtList), isLoading, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectLocationStateImplCopyWith<_$SelectLocationStateImpl> get copyWith =>
      __$$SelectLocationStateImplCopyWithImpl<_$SelectLocationStateImpl>(
          this, _$identity);
}

abstract class _SelectLocationState implements SelectLocationState {
  const factory _SelectLocationState(
      {final List<District> districtList,
      final bool isLoading,
      final SelectLocationStatus status}) = _$SelectLocationStateImpl;

  @override
  List<District> get districtList;
  @override
  bool get isLoading;
  @override
  SelectLocationStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$SelectLocationStateImplCopyWith<_$SelectLocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
