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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userEmail, String userPassword, BuildContext context)
        signInDataSubmit,
    required TResult Function() isPasswordObscure,
    required TResult Function(bool isRememberMe) isRemember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userEmail, String userPassword, BuildContext context)?
        signInDataSubmit,
    TResult? Function()? isPasswordObscure,
    TResult? Function(bool isRememberMe)? isRemember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String userEmail, String userPassword, BuildContext context)?
        signInDataSubmit,
    TResult Function()? isPasswordObscure,
    TResult Function(bool isRememberMe)? isRemember,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInDataSubmit value) signInDataSubmit,
    required TResult Function(_IsPasswordObscure value) isPasswordObscure,
    required TResult Function(_IsRemember value) isRemember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInDataSubmit value)? signInDataSubmit,
    TResult? Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult? Function(_IsRemember value)? isRemember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInDataSubmit value)? signInDataSubmit,
    TResult Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult Function(_IsRemember value)? isRemember,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res, SignInEvent>;
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
}

/// @nodoc
abstract class _$$SignInDataSubmitImplCopyWith<$Res> {
  factory _$$SignInDataSubmitImplCopyWith(_$SignInDataSubmitImpl value,
          $Res Function(_$SignInDataSubmitImpl) then) =
      __$$SignInDataSubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userEmail, String userPassword, BuildContext context});
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
    Object? context = null,
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
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$SignInDataSubmitImpl
    with DiagnosticableTreeMixin
    implements _SignInDataSubmit {
  const _$SignInDataSubmitImpl(
      {required this.userEmail,
      required this.userPassword,
      required this.context});

  @override
  final String userEmail;
  @override
  final String userPassword;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInEvent.signInDataSubmit(userEmail: $userEmail, userPassword: $userPassword, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInEvent.signInDataSubmit'))
      ..add(DiagnosticsProperty('userEmail', userEmail))
      ..add(DiagnosticsProperty('userPassword', userPassword))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInDataSubmitImpl &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.userPassword, userPassword) ||
                other.userPassword == userPassword) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userEmail, userPassword, context);

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
    required TResult Function(
            String userEmail, String userPassword, BuildContext context)
        signInDataSubmit,
    required TResult Function() isPasswordObscure,
    required TResult Function(bool isRememberMe) isRemember,
  }) {
    return signInDataSubmit(userEmail, userPassword, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userEmail, String userPassword, BuildContext context)?
        signInDataSubmit,
    TResult? Function()? isPasswordObscure,
    TResult? Function(bool isRememberMe)? isRemember,
  }) {
    return signInDataSubmit?.call(userEmail, userPassword, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String userEmail, String userPassword, BuildContext context)?
        signInDataSubmit,
    TResult Function()? isPasswordObscure,
    TResult Function(bool isRememberMe)? isRemember,
    required TResult orElse(),
  }) {
    if (signInDataSubmit != null) {
      return signInDataSubmit(userEmail, userPassword, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInDataSubmit value) signInDataSubmit,
    required TResult Function(_IsPasswordObscure value) isPasswordObscure,
    required TResult Function(_IsRemember value) isRemember,
  }) {
    return signInDataSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInDataSubmit value)? signInDataSubmit,
    TResult? Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult? Function(_IsRemember value)? isRemember,
  }) {
    return signInDataSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInDataSubmit value)? signInDataSubmit,
    TResult Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult Function(_IsRemember value)? isRemember,
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
      required final String userPassword,
      required final BuildContext context}) = _$SignInDataSubmitImpl;

  String get userEmail;
  String get userPassword;
  BuildContext get context;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInDataSubmitImplCopyWith<_$SignInDataSubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsPasswordObscureImplCopyWith<$Res> {
  factory _$$IsPasswordObscureImplCopyWith(_$IsPasswordObscureImpl value,
          $Res Function(_$IsPasswordObscureImpl) then) =
      __$$IsPasswordObscureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsPasswordObscureImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$IsPasswordObscureImpl>
    implements _$$IsPasswordObscureImplCopyWith<$Res> {
  __$$IsPasswordObscureImplCopyWithImpl(_$IsPasswordObscureImpl _value,
      $Res Function(_$IsPasswordObscureImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IsPasswordObscureImpl
    with DiagnosticableTreeMixin
    implements _IsPasswordObscure {
  const _$IsPasswordObscureImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInEvent.isPasswordObscure()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'SignInEvent.isPasswordObscure'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsPasswordObscureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userEmail, String userPassword, BuildContext context)
        signInDataSubmit,
    required TResult Function() isPasswordObscure,
    required TResult Function(bool isRememberMe) isRemember,
  }) {
    return isPasswordObscure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userEmail, String userPassword, BuildContext context)?
        signInDataSubmit,
    TResult? Function()? isPasswordObscure,
    TResult? Function(bool isRememberMe)? isRemember,
  }) {
    return isPasswordObscure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String userEmail, String userPassword, BuildContext context)?
        signInDataSubmit,
    TResult Function()? isPasswordObscure,
    TResult Function(bool isRememberMe)? isRemember,
    required TResult orElse(),
  }) {
    if (isPasswordObscure != null) {
      return isPasswordObscure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInDataSubmit value) signInDataSubmit,
    required TResult Function(_IsPasswordObscure value) isPasswordObscure,
    required TResult Function(_IsRemember value) isRemember,
  }) {
    return isPasswordObscure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInDataSubmit value)? signInDataSubmit,
    TResult? Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult? Function(_IsRemember value)? isRemember,
  }) {
    return isPasswordObscure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInDataSubmit value)? signInDataSubmit,
    TResult Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult Function(_IsRemember value)? isRemember,
    required TResult orElse(),
  }) {
    if (isPasswordObscure != null) {
      return isPasswordObscure(this);
    }
    return orElse();
  }
}

abstract class _IsPasswordObscure implements SignInEvent {
  const factory _IsPasswordObscure() = _$IsPasswordObscureImpl;
}

/// @nodoc
abstract class _$$IsRememberImplCopyWith<$Res> {
  factory _$$IsRememberImplCopyWith(
          _$IsRememberImpl value, $Res Function(_$IsRememberImpl) then) =
      __$$IsRememberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isRememberMe});
}

/// @nodoc
class __$$IsRememberImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$IsRememberImpl>
    implements _$$IsRememberImplCopyWith<$Res> {
  __$$IsRememberImplCopyWithImpl(
      _$IsRememberImpl _value, $Res Function(_$IsRememberImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRememberMe = null,
  }) {
    return _then(_$IsRememberImpl(
      isRememberMe: null == isRememberMe
          ? _value.isRememberMe
          : isRememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsRememberImpl with DiagnosticableTreeMixin implements _IsRemember {
  const _$IsRememberImpl({required this.isRememberMe});

  @override
  final bool isRememberMe;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInEvent.isRemember(isRememberMe: $isRememberMe)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInEvent.isRemember'))
      ..add(DiagnosticsProperty('isRememberMe', isRememberMe));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsRememberImpl &&
            (identical(other.isRememberMe, isRememberMe) ||
                other.isRememberMe == isRememberMe));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRememberMe);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IsRememberImplCopyWith<_$IsRememberImpl> get copyWith =>
      __$$IsRememberImplCopyWithImpl<_$IsRememberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userEmail, String userPassword, BuildContext context)
        signInDataSubmit,
    required TResult Function() isPasswordObscure,
    required TResult Function(bool isRememberMe) isRemember,
  }) {
    return isRemember(isRememberMe);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userEmail, String userPassword, BuildContext context)?
        signInDataSubmit,
    TResult? Function()? isPasswordObscure,
    TResult? Function(bool isRememberMe)? isRemember,
  }) {
    return isRemember?.call(isRememberMe);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String userEmail, String userPassword, BuildContext context)?
        signInDataSubmit,
    TResult Function()? isPasswordObscure,
    TResult Function(bool isRememberMe)? isRemember,
    required TResult orElse(),
  }) {
    if (isRemember != null) {
      return isRemember(isRememberMe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInDataSubmit value) signInDataSubmit,
    required TResult Function(_IsPasswordObscure value) isPasswordObscure,
    required TResult Function(_IsRemember value) isRemember,
  }) {
    return isRemember(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInDataSubmit value)? signInDataSubmit,
    TResult? Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult? Function(_IsRemember value)? isRemember,
  }) {
    return isRemember?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInDataSubmit value)? signInDataSubmit,
    TResult Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult Function(_IsRemember value)? isRemember,
    required TResult orElse(),
  }) {
    if (isRemember != null) {
      return isRemember(this);
    }
    return orElse();
  }
}

abstract class _IsRemember implements SignInEvent {
  const factory _IsRemember({required final bool isRememberMe}) =
      _$IsRememberImpl;

  bool get isRememberMe;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IsRememberImplCopyWith<_$IsRememberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignInState {
  bool get isRemember => throw _privateConstructorUsedError;
  bool get isPasswordObscure => throw _privateConstructorUsedError;
  SignInStatus get signInStatus => throw _privateConstructorUsedError;
  SignInResponse get signInResponse => throw _privateConstructorUsedError;

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
  $Res call(
      {bool isRemember,
      bool isPasswordObscure,
      SignInStatus signInStatus,
      SignInResponse signInResponse});
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
    Object? isPasswordObscure = null,
    Object? signInStatus = null,
    Object? signInResponse = null,
  }) {
    return _then(_value.copyWith(
      isRemember: null == isRemember
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordObscure: null == isPasswordObscure
          ? _value.isPasswordObscure
          : isPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      signInStatus: null == signInStatus
          ? _value.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as SignInStatus,
      signInResponse: null == signInResponse
          ? _value.signInResponse
          : signInResponse // ignore: cast_nullable_to_non_nullable
              as SignInResponse,
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
  $Res call(
      {bool isRemember,
      bool isPasswordObscure,
      SignInStatus signInStatus,
      SignInResponse signInResponse});
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
    Object? isPasswordObscure = null,
    Object? signInStatus = null,
    Object? signInResponse = null,
  }) {
    return _then(_$SignInStateImpl(
      isRemember: null == isRemember
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordObscure: null == isPasswordObscure
          ? _value.isPasswordObscure
          : isPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      signInStatus: null == signInStatus
          ? _value.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as SignInStatus,
      signInResponse: null == signInResponse
          ? _value.signInResponse
          : signInResponse // ignore: cast_nullable_to_non_nullable
              as SignInResponse,
    ));
  }
}

/// @nodoc

class _$SignInStateImpl with DiagnosticableTreeMixin implements _SignInState {
  const _$SignInStateImpl(
      {this.isRemember = false,
      this.isPasswordObscure = true,
      this.signInStatus = SignInStatus.initial,
      this.signInResponse = const SignInResponse()});

  @override
  @JsonKey()
  final bool isRemember;
  @override
  @JsonKey()
  final bool isPasswordObscure;
  @override
  @JsonKey()
  final SignInStatus signInStatus;
  @override
  @JsonKey()
  final SignInResponse signInResponse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState(isRemember: $isRemember, isPasswordObscure: $isPasswordObscure, signInStatus: $signInStatus, signInResponse: $signInResponse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInState'))
      ..add(DiagnosticsProperty('isRemember', isRemember))
      ..add(DiagnosticsProperty('isPasswordObscure', isPasswordObscure))
      ..add(DiagnosticsProperty('signInStatus', signInStatus))
      ..add(DiagnosticsProperty('signInResponse', signInResponse));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateImpl &&
            (identical(other.isRemember, isRemember) ||
                other.isRemember == isRemember) &&
            (identical(other.isPasswordObscure, isPasswordObscure) ||
                other.isPasswordObscure == isPasswordObscure) &&
            (identical(other.signInStatus, signInStatus) ||
                other.signInStatus == signInStatus) &&
            (identical(other.signInResponse, signInResponse) ||
                other.signInResponse == signInResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isRemember, isPasswordObscure, signInStatus, signInResponse);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      __$$SignInStateImplCopyWithImpl<_$SignInStateImpl>(this, _$identity);
}

abstract class _SignInState implements SignInState {
  const factory _SignInState(
      {final bool isRemember,
      final bool isPasswordObscure,
      final SignInStatus signInStatus,
      final SignInResponse signInResponse}) = _$SignInStateImpl;

  @override
  bool get isRemember;
  @override
  bool get isPasswordObscure;
  @override
  SignInStatus get signInStatus;
  @override
  SignInResponse get signInResponse;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
