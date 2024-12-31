// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInEvent {
  String get userEmail => throw _privateConstructorUsedError;
  String get userPassword => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userEmail, String userPassword)
        signInDataSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userEmail, String userPassword)? signInDataSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userEmail, String userPassword)? signInDataSubmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInDataSubmit value) signInDataSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInDataSubmit value)? signInDataSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInDataSubmit value)? signInDataSubmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInEventCopyWith<SignInEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res, SignInEvent>;
  @useResult
  $Res call({String userEmail, String userPassword});
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res, $Val extends SignInEvent>
    implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEmail = null,
    Object? userPassword = null,
  }) {
    return _then(_value.copyWith(
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userPassword: null == userPassword
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInDataSubmitImplCopyWith<$Res>
    implements $SignInEventCopyWith<$Res> {
  factory _$$SignInDataSubmitImplCopyWith(_$SignInDataSubmitImpl value,
          $Res Function(_$SignInDataSubmitImpl) then) =
      __$$SignInDataSubmitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userEmail, String userPassword});
}

/// @nodoc
class __$$SignInDataSubmitImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$SignInDataSubmitImpl>
    implements _$$SignInDataSubmitImplCopyWith<$Res> {
  __$$SignInDataSubmitImplCopyWithImpl(_$SignInDataSubmitImpl _value,
      $Res Function(_$SignInDataSubmitImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEmail = null,
    Object? userPassword = null,
  }) {
    return _then(_$SignInDataSubmitImpl(
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userPassword: null == userPassword
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInDataSubmitImpl
    with DiagnosticableTreeMixin
    implements _SignInDataSubmit {
  const _$SignInDataSubmitImpl(
      {required this.userEmail, required this.userPassword});

  @override
  final String userEmail;
  @override
  final String userPassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInEvent.signInDataSubmit(userEmail: $userEmail, userPassword: $userPassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInEvent.signInDataSubmit'))
      ..add(DiagnosticsProperty('userEmail', userEmail))
      ..add(DiagnosticsProperty('userPassword', userPassword));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInDataSubmitImpl &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.userPassword, userPassword) ||
                other.userPassword == userPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userEmail, userPassword);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInDataSubmitImplCopyWith<_$SignInDataSubmitImpl> get copyWith =>
      __$$SignInDataSubmitImplCopyWithImpl<_$SignInDataSubmitImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userEmail, String userPassword)
        signInDataSubmit,
  }) {
    return signInDataSubmit(userEmail, userPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userEmail, String userPassword)? signInDataSubmit,
  }) {
    return signInDataSubmit?.call(userEmail, userPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userEmail, String userPassword)? signInDataSubmit,
    required TResult orElse(),
  }) {
    if (signInDataSubmit != null) {
      return signInDataSubmit(userEmail, userPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInDataSubmit value) signInDataSubmit,
  }) {
    return signInDataSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInDataSubmit value)? signInDataSubmit,
  }) {
    return signInDataSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInDataSubmit value)? signInDataSubmit,
    required TResult orElse(),
  }) {
    if (signInDataSubmit != null) {
      return signInDataSubmit(this);
    }
    return orElse();
  }
}

abstract class _SignInDataSubmit implements SignInEvent {
  const factory _SignInDataSubmit(
      {required final String userEmail,
      required final String userPassword}) = _$SignInDataSubmitImpl;

  @override
  String get userEmail;
  @override
  String get userPassword;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInDataSubmitImplCopyWith<_$SignInDataSubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignInState {
  bool get isRemember => throw _privateConstructorUsedError;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
  @useResult
  $Res call({bool isRemember});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRemember = null,
  }) {
    return _then(_value.copyWith(
      isRemember: null == isRemember
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInStateImplCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$$SignInStateImplCopyWith(
          _$SignInStateImpl value, $Res Function(_$SignInStateImpl) then) =
      __$$SignInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isRemember});
}

/// @nodoc
class __$$SignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateImpl>
    implements _$$SignInStateImplCopyWith<$Res> {
  __$$SignInStateImplCopyWithImpl(
      _$SignInStateImpl _value, $Res Function(_$SignInStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRemember = null,
  }) {
    return _then(_$SignInStateImpl(
      isRemember: null == isRemember
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignInStateImpl with DiagnosticableTreeMixin implements _SignInState {
  const _$SignInStateImpl({this.isRemember = false});

  @override
  @JsonKey()
  final bool isRemember;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState(isRemember: $isRemember)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInState'))
      ..add(DiagnosticsProperty('isRemember', isRemember));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateImpl &&
            (identical(other.isRemember, isRemember) ||
                other.isRemember == isRemember));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRemember);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      __$$SignInStateImplCopyWithImpl<_$SignInStateImpl>(this, _$identity);
}

abstract class _SignInState implements SignInState {
  const factory _SignInState({final bool isRemember}) = _$SignInStateImpl;

  @override
  bool get isRemember;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
