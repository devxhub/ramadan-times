// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signWithGoogle,
    required TResult Function() signWithApple,
    required TResult Function() signWithEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signWithGoogle,
    TResult? Function()? signWithApple,
    TResult? Function()? signWithEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signWithGoogle,
    TResult Function()? signWithApple,
    TResult Function()? signWithEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignWithGoogle value) signWithGoogle,
    required TResult Function(_SignWithApple value) signWithApple,
    required TResult Function(_SignWithEmail value) signWithEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignWithGoogle value)? signWithGoogle,
    TResult? Function(_SignWithApple value)? signWithApple,
    TResult? Function(_SignWithEmail value)? signWithEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignWithGoogle value)? signWithGoogle,
    TResult Function(_SignWithApple value)? signWithApple,
    TResult Function(_SignWithEmail value)? signWithEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignWithGoogleImplCopyWith<$Res> {
  factory _$$SignWithGoogleImplCopyWith(_$SignWithGoogleImpl value,
          $Res Function(_$SignWithGoogleImpl) then) =
      __$$SignWithGoogleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignWithGoogleImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignWithGoogleImpl>
    implements _$$SignWithGoogleImplCopyWith<$Res> {
  __$$SignWithGoogleImplCopyWithImpl(
      _$SignWithGoogleImpl _value, $Res Function(_$SignWithGoogleImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignWithGoogleImpl
    with DiagnosticableTreeMixin
    implements _SignWithGoogle {
  const _$SignWithGoogleImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.signWithGoogle()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignUpEvent.signWithGoogle'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignWithGoogleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signWithGoogle,
    required TResult Function() signWithApple,
    required TResult Function() signWithEmail,
  }) {
    return signWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signWithGoogle,
    TResult? Function()? signWithApple,
    TResult? Function()? signWithEmail,
  }) {
    return signWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signWithGoogle,
    TResult Function()? signWithApple,
    TResult Function()? signWithEmail,
    required TResult orElse(),
  }) {
    if (signWithGoogle != null) {
      return signWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignWithGoogle value) signWithGoogle,
    required TResult Function(_SignWithApple value) signWithApple,
    required TResult Function(_SignWithEmail value) signWithEmail,
  }) {
    return signWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignWithGoogle value)? signWithGoogle,
    TResult? Function(_SignWithApple value)? signWithApple,
    TResult? Function(_SignWithEmail value)? signWithEmail,
  }) {
    return signWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignWithGoogle value)? signWithGoogle,
    TResult Function(_SignWithApple value)? signWithApple,
    TResult Function(_SignWithEmail value)? signWithEmail,
    required TResult orElse(),
  }) {
    if (signWithGoogle != null) {
      return signWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _SignWithGoogle implements SignUpEvent {
  const factory _SignWithGoogle() = _$SignWithGoogleImpl;
}

/// @nodoc
abstract class _$$SignWithAppleImplCopyWith<$Res> {
  factory _$$SignWithAppleImplCopyWith(
          _$SignWithAppleImpl value, $Res Function(_$SignWithAppleImpl) then) =
      __$$SignWithAppleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignWithAppleImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignWithAppleImpl>
    implements _$$SignWithAppleImplCopyWith<$Res> {
  __$$SignWithAppleImplCopyWithImpl(
      _$SignWithAppleImpl _value, $Res Function(_$SignWithAppleImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignWithAppleImpl
    with DiagnosticableTreeMixin
    implements _SignWithApple {
  const _$SignWithAppleImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.signWithApple()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignUpEvent.signWithApple'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignWithAppleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signWithGoogle,
    required TResult Function() signWithApple,
    required TResult Function() signWithEmail,
  }) {
    return signWithApple();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signWithGoogle,
    TResult? Function()? signWithApple,
    TResult? Function()? signWithEmail,
  }) {
    return signWithApple?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signWithGoogle,
    TResult Function()? signWithApple,
    TResult Function()? signWithEmail,
    required TResult orElse(),
  }) {
    if (signWithApple != null) {
      return signWithApple();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignWithGoogle value) signWithGoogle,
    required TResult Function(_SignWithApple value) signWithApple,
    required TResult Function(_SignWithEmail value) signWithEmail,
  }) {
    return signWithApple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignWithGoogle value)? signWithGoogle,
    TResult? Function(_SignWithApple value)? signWithApple,
    TResult? Function(_SignWithEmail value)? signWithEmail,
  }) {
    return signWithApple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignWithGoogle value)? signWithGoogle,
    TResult Function(_SignWithApple value)? signWithApple,
    TResult Function(_SignWithEmail value)? signWithEmail,
    required TResult orElse(),
  }) {
    if (signWithApple != null) {
      return signWithApple(this);
    }
    return orElse();
  }
}

abstract class _SignWithApple implements SignUpEvent {
  const factory _SignWithApple() = _$SignWithAppleImpl;
}

/// @nodoc
abstract class _$$SignWithEmailImplCopyWith<$Res> {
  factory _$$SignWithEmailImplCopyWith(
          _$SignWithEmailImpl value, $Res Function(_$SignWithEmailImpl) then) =
      __$$SignWithEmailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignWithEmailImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignWithEmailImpl>
    implements _$$SignWithEmailImplCopyWith<$Res> {
  __$$SignWithEmailImplCopyWithImpl(
      _$SignWithEmailImpl _value, $Res Function(_$SignWithEmailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignWithEmailImpl
    with DiagnosticableTreeMixin
    implements _SignWithEmail {
  const _$SignWithEmailImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.signWithEmail()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignUpEvent.signWithEmail'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignWithEmailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signWithGoogle,
    required TResult Function() signWithApple,
    required TResult Function() signWithEmail,
  }) {
    return signWithEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signWithGoogle,
    TResult? Function()? signWithApple,
    TResult? Function()? signWithEmail,
  }) {
    return signWithEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signWithGoogle,
    TResult Function()? signWithApple,
    TResult Function()? signWithEmail,
    required TResult orElse(),
  }) {
    if (signWithEmail != null) {
      return signWithEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignWithGoogle value) signWithGoogle,
    required TResult Function(_SignWithApple value) signWithApple,
    required TResult Function(_SignWithEmail value) signWithEmail,
  }) {
    return signWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignWithGoogle value)? signWithGoogle,
    TResult? Function(_SignWithApple value)? signWithApple,
    TResult? Function(_SignWithEmail value)? signWithEmail,
  }) {
    return signWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignWithGoogle value)? signWithGoogle,
    TResult Function(_SignWithApple value)? signWithApple,
    TResult Function(_SignWithEmail value)? signWithEmail,
    required TResult orElse(),
  }) {
    if (signWithEmail != null) {
      return signWithEmail(this);
    }
    return orElse();
  }
}

abstract class _SignWithEmail implements SignUpEvent {
  const factory _SignWithEmail() = _$SignWithEmailImpl;
}

/// @nodoc
mixin _$SignUpState {
  bool get isRemember => throw _privateConstructorUsedError;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call({bool isRemember});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpState
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
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
          _$SignUpStateImpl value, $Res Function(_$SignUpStateImpl) then) =
      __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isRemember});
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
      _$SignUpStateImpl _value, $Res Function(_$SignUpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRemember = null,
  }) {
    return _then(_$SignUpStateImpl(
      isRemember: null == isRemember
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignUpStateImpl with DiagnosticableTreeMixin implements _SignUpState {
  const _$SignUpStateImpl({this.isRemember = false});

  @override
  @JsonKey()
  final bool isRemember;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState(isRemember: $isRemember)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState'))
      ..add(DiagnosticsProperty('isRemember', isRemember));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.isRemember, isRemember) ||
                other.isRemember == isRemember));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRemember);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  const factory _SignUpState({final bool isRemember}) = _$SignUpStateImpl;

  @override
  bool get isRemember;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
