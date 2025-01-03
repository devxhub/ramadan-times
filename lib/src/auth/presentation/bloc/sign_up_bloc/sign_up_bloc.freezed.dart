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
    required TResult Function(BuildContext context) signWithGoogle,
    required TResult Function(BuildContext context) signWithApple,
    required TResult Function(
            String name, String email, String password, BuildContext context)
        signWithEmail,
    required TResult Function() isPasswordObscure,
    required TResult Function() isConfirmPasswordObscure,
    required TResult Function(double containerHeight) updateContainerHeight,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? signWithGoogle,
    TResult? Function(BuildContext context)? signWithApple,
    TResult? Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult? Function()? isPasswordObscure,
    TResult? Function()? isConfirmPasswordObscure,
    TResult? Function(double containerHeight)? updateContainerHeight,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? signWithGoogle,
    TResult Function(BuildContext context)? signWithApple,
    TResult Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult Function()? isPasswordObscure,
    TResult Function()? isConfirmPasswordObscure,
    TResult Function(double containerHeight)? updateContainerHeight,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignWithGoogle value) signWithGoogle,
    required TResult Function(_SignWithApple value) signWithApple,
    required TResult Function(_SignWithEmail value) signWithEmail,
    required TResult Function(_IsPasswordObscure value) isPasswordObscure,
    required TResult Function(_IsConfirmPasswordObscure value)
        isConfirmPasswordObscure,
    required TResult Function(_UpdateContainerHeight value)
        updateContainerHeight,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignWithGoogle value)? signWithGoogle,
    TResult? Function(_SignWithApple value)? signWithApple,
    TResult? Function(_SignWithEmail value)? signWithEmail,
    TResult? Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult? Function(_IsConfirmPasswordObscure value)?
        isConfirmPasswordObscure,
    TResult? Function(_UpdateContainerHeight value)? updateContainerHeight,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignWithGoogle value)? signWithGoogle,
    TResult Function(_SignWithApple value)? signWithApple,
    TResult Function(_SignWithEmail value)? signWithEmail,
    TResult Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult Function(_IsConfirmPasswordObscure value)? isConfirmPasswordObscure,
    TResult Function(_UpdateContainerHeight value)? updateContainerHeight,
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
  @useResult
  $Res call({BuildContext context});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$SignWithGoogleImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$SignWithGoogleImpl
    with DiagnosticableTreeMixin
    implements _SignWithGoogle {
  const _$SignWithGoogleImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.signWithGoogle(context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpEvent.signWithGoogle'))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignWithGoogleImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignWithGoogleImplCopyWith<_$SignWithGoogleImpl> get copyWith =>
      __$$SignWithGoogleImplCopyWithImpl<_$SignWithGoogleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) signWithGoogle,
    required TResult Function(BuildContext context) signWithApple,
    required TResult Function(
            String name, String email, String password, BuildContext context)
        signWithEmail,
    required TResult Function() isPasswordObscure,
    required TResult Function() isConfirmPasswordObscure,
    required TResult Function(double containerHeight) updateContainerHeight,
  }) {
    return signWithGoogle(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? signWithGoogle,
    TResult? Function(BuildContext context)? signWithApple,
    TResult? Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult? Function()? isPasswordObscure,
    TResult? Function()? isConfirmPasswordObscure,
    TResult? Function(double containerHeight)? updateContainerHeight,
  }) {
    return signWithGoogle?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? signWithGoogle,
    TResult Function(BuildContext context)? signWithApple,
    TResult Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult Function()? isPasswordObscure,
    TResult Function()? isConfirmPasswordObscure,
    TResult Function(double containerHeight)? updateContainerHeight,
    required TResult orElse(),
  }) {
    if (signWithGoogle != null) {
      return signWithGoogle(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignWithGoogle value) signWithGoogle,
    required TResult Function(_SignWithApple value) signWithApple,
    required TResult Function(_SignWithEmail value) signWithEmail,
    required TResult Function(_IsPasswordObscure value) isPasswordObscure,
    required TResult Function(_IsConfirmPasswordObscure value)
        isConfirmPasswordObscure,
    required TResult Function(_UpdateContainerHeight value)
        updateContainerHeight,
  }) {
    return signWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignWithGoogle value)? signWithGoogle,
    TResult? Function(_SignWithApple value)? signWithApple,
    TResult? Function(_SignWithEmail value)? signWithEmail,
    TResult? Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult? Function(_IsConfirmPasswordObscure value)?
        isConfirmPasswordObscure,
    TResult? Function(_UpdateContainerHeight value)? updateContainerHeight,
  }) {
    return signWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignWithGoogle value)? signWithGoogle,
    TResult Function(_SignWithApple value)? signWithApple,
    TResult Function(_SignWithEmail value)? signWithEmail,
    TResult Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult Function(_IsConfirmPasswordObscure value)? isConfirmPasswordObscure,
    TResult Function(_UpdateContainerHeight value)? updateContainerHeight,
    required TResult orElse(),
  }) {
    if (signWithGoogle != null) {
      return signWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _SignWithGoogle implements SignUpEvent {
  const factory _SignWithGoogle({required final BuildContext context}) =
      _$SignWithGoogleImpl;

  BuildContext get context;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignWithGoogleImplCopyWith<_$SignWithGoogleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignWithAppleImplCopyWith<$Res> {
  factory _$$SignWithAppleImplCopyWith(
          _$SignWithAppleImpl value, $Res Function(_$SignWithAppleImpl) then) =
      __$$SignWithAppleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$SignWithAppleImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$SignWithAppleImpl
    with DiagnosticableTreeMixin
    implements _SignWithApple {
  const _$SignWithAppleImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.signWithApple(context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpEvent.signWithApple'))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignWithAppleImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignWithAppleImplCopyWith<_$SignWithAppleImpl> get copyWith =>
      __$$SignWithAppleImplCopyWithImpl<_$SignWithAppleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) signWithGoogle,
    required TResult Function(BuildContext context) signWithApple,
    required TResult Function(
            String name, String email, String password, BuildContext context)
        signWithEmail,
    required TResult Function() isPasswordObscure,
    required TResult Function() isConfirmPasswordObscure,
    required TResult Function(double containerHeight) updateContainerHeight,
  }) {
    return signWithApple(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? signWithGoogle,
    TResult? Function(BuildContext context)? signWithApple,
    TResult? Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult? Function()? isPasswordObscure,
    TResult? Function()? isConfirmPasswordObscure,
    TResult? Function(double containerHeight)? updateContainerHeight,
  }) {
    return signWithApple?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? signWithGoogle,
    TResult Function(BuildContext context)? signWithApple,
    TResult Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult Function()? isPasswordObscure,
    TResult Function()? isConfirmPasswordObscure,
    TResult Function(double containerHeight)? updateContainerHeight,
    required TResult orElse(),
  }) {
    if (signWithApple != null) {
      return signWithApple(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignWithGoogle value) signWithGoogle,
    required TResult Function(_SignWithApple value) signWithApple,
    required TResult Function(_SignWithEmail value) signWithEmail,
    required TResult Function(_IsPasswordObscure value) isPasswordObscure,
    required TResult Function(_IsConfirmPasswordObscure value)
        isConfirmPasswordObscure,
    required TResult Function(_UpdateContainerHeight value)
        updateContainerHeight,
  }) {
    return signWithApple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignWithGoogle value)? signWithGoogle,
    TResult? Function(_SignWithApple value)? signWithApple,
    TResult? Function(_SignWithEmail value)? signWithEmail,
    TResult? Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult? Function(_IsConfirmPasswordObscure value)?
        isConfirmPasswordObscure,
    TResult? Function(_UpdateContainerHeight value)? updateContainerHeight,
  }) {
    return signWithApple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignWithGoogle value)? signWithGoogle,
    TResult Function(_SignWithApple value)? signWithApple,
    TResult Function(_SignWithEmail value)? signWithEmail,
    TResult Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult Function(_IsConfirmPasswordObscure value)? isConfirmPasswordObscure,
    TResult Function(_UpdateContainerHeight value)? updateContainerHeight,
    required TResult orElse(),
  }) {
    if (signWithApple != null) {
      return signWithApple(this);
    }
    return orElse();
  }
}

abstract class _SignWithApple implements SignUpEvent {
  const factory _SignWithApple({required final BuildContext context}) =
      _$SignWithAppleImpl;

  BuildContext get context;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignWithAppleImplCopyWith<_$SignWithAppleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignWithEmailImplCopyWith<$Res> {
  factory _$$SignWithEmailImplCopyWith(
          _$SignWithEmailImpl value, $Res Function(_$SignWithEmailImpl) then) =
      __$$SignWithEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String email, String password, BuildContext context});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? context = null,
  }) {
    return _then(_$SignWithEmailImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$SignWithEmailImpl
    with DiagnosticableTreeMixin
    implements _SignWithEmail {
  const _$SignWithEmailImpl(
      {required this.name,
      required this.email,
      required this.password,
      required this.context});

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final BuildContext context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.signWithEmail(name: $name, email: $email, password: $password, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpEvent.signWithEmail'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignWithEmailImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password, context);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignWithEmailImplCopyWith<_$SignWithEmailImpl> get copyWith =>
      __$$SignWithEmailImplCopyWithImpl<_$SignWithEmailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) signWithGoogle,
    required TResult Function(BuildContext context) signWithApple,
    required TResult Function(
            String name, String email, String password, BuildContext context)
        signWithEmail,
    required TResult Function() isPasswordObscure,
    required TResult Function() isConfirmPasswordObscure,
    required TResult Function(double containerHeight) updateContainerHeight,
  }) {
    return signWithEmail(name, email, password, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? signWithGoogle,
    TResult? Function(BuildContext context)? signWithApple,
    TResult? Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult? Function()? isPasswordObscure,
    TResult? Function()? isConfirmPasswordObscure,
    TResult? Function(double containerHeight)? updateContainerHeight,
  }) {
    return signWithEmail?.call(name, email, password, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? signWithGoogle,
    TResult Function(BuildContext context)? signWithApple,
    TResult Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult Function()? isPasswordObscure,
    TResult Function()? isConfirmPasswordObscure,
    TResult Function(double containerHeight)? updateContainerHeight,
    required TResult orElse(),
  }) {
    if (signWithEmail != null) {
      return signWithEmail(name, email, password, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignWithGoogle value) signWithGoogle,
    required TResult Function(_SignWithApple value) signWithApple,
    required TResult Function(_SignWithEmail value) signWithEmail,
    required TResult Function(_IsPasswordObscure value) isPasswordObscure,
    required TResult Function(_IsConfirmPasswordObscure value)
        isConfirmPasswordObscure,
    required TResult Function(_UpdateContainerHeight value)
        updateContainerHeight,
  }) {
    return signWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignWithGoogle value)? signWithGoogle,
    TResult? Function(_SignWithApple value)? signWithApple,
    TResult? Function(_SignWithEmail value)? signWithEmail,
    TResult? Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult? Function(_IsConfirmPasswordObscure value)?
        isConfirmPasswordObscure,
    TResult? Function(_UpdateContainerHeight value)? updateContainerHeight,
  }) {
    return signWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignWithGoogle value)? signWithGoogle,
    TResult Function(_SignWithApple value)? signWithApple,
    TResult Function(_SignWithEmail value)? signWithEmail,
    TResult Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult Function(_IsConfirmPasswordObscure value)? isConfirmPasswordObscure,
    TResult Function(_UpdateContainerHeight value)? updateContainerHeight,
    required TResult orElse(),
  }) {
    if (signWithEmail != null) {
      return signWithEmail(this);
    }
    return orElse();
  }
}

abstract class _SignWithEmail implements SignUpEvent {
  const factory _SignWithEmail(
      {required final String name,
      required final String email,
      required final String password,
      required final BuildContext context}) = _$SignWithEmailImpl;

  String get name;
  String get email;
  String get password;
  BuildContext get context;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignWithEmailImplCopyWith<_$SignWithEmailImpl> get copyWith =>
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
    extends _$SignUpEventCopyWithImpl<$Res, _$IsPasswordObscureImpl>
    implements _$$IsPasswordObscureImplCopyWith<$Res> {
  __$$IsPasswordObscureImplCopyWithImpl(_$IsPasswordObscureImpl _value,
      $Res Function(_$IsPasswordObscureImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IsPasswordObscureImpl
    with DiagnosticableTreeMixin
    implements _IsPasswordObscure {
  const _$IsPasswordObscureImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.isPasswordObscure()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'SignUpEvent.isPasswordObscure'));
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
    required TResult Function(BuildContext context) signWithGoogle,
    required TResult Function(BuildContext context) signWithApple,
    required TResult Function(
            String name, String email, String password, BuildContext context)
        signWithEmail,
    required TResult Function() isPasswordObscure,
    required TResult Function() isConfirmPasswordObscure,
    required TResult Function(double containerHeight) updateContainerHeight,
  }) {
    return isPasswordObscure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? signWithGoogle,
    TResult? Function(BuildContext context)? signWithApple,
    TResult? Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult? Function()? isPasswordObscure,
    TResult? Function()? isConfirmPasswordObscure,
    TResult? Function(double containerHeight)? updateContainerHeight,
  }) {
    return isPasswordObscure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? signWithGoogle,
    TResult Function(BuildContext context)? signWithApple,
    TResult Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult Function()? isPasswordObscure,
    TResult Function()? isConfirmPasswordObscure,
    TResult Function(double containerHeight)? updateContainerHeight,
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
    required TResult Function(_SignWithGoogle value) signWithGoogle,
    required TResult Function(_SignWithApple value) signWithApple,
    required TResult Function(_SignWithEmail value) signWithEmail,
    required TResult Function(_IsPasswordObscure value) isPasswordObscure,
    required TResult Function(_IsConfirmPasswordObscure value)
        isConfirmPasswordObscure,
    required TResult Function(_UpdateContainerHeight value)
        updateContainerHeight,
  }) {
    return isPasswordObscure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignWithGoogle value)? signWithGoogle,
    TResult? Function(_SignWithApple value)? signWithApple,
    TResult? Function(_SignWithEmail value)? signWithEmail,
    TResult? Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult? Function(_IsConfirmPasswordObscure value)?
        isConfirmPasswordObscure,
    TResult? Function(_UpdateContainerHeight value)? updateContainerHeight,
  }) {
    return isPasswordObscure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignWithGoogle value)? signWithGoogle,
    TResult Function(_SignWithApple value)? signWithApple,
    TResult Function(_SignWithEmail value)? signWithEmail,
    TResult Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult Function(_IsConfirmPasswordObscure value)? isConfirmPasswordObscure,
    TResult Function(_UpdateContainerHeight value)? updateContainerHeight,
    required TResult orElse(),
  }) {
    if (isPasswordObscure != null) {
      return isPasswordObscure(this);
    }
    return orElse();
  }
}

abstract class _IsPasswordObscure implements SignUpEvent {
  const factory _IsPasswordObscure() = _$IsPasswordObscureImpl;
}

/// @nodoc
abstract class _$$IsConfirmPasswordObscureImplCopyWith<$Res> {
  factory _$$IsConfirmPasswordObscureImplCopyWith(
          _$IsConfirmPasswordObscureImpl value,
          $Res Function(_$IsConfirmPasswordObscureImpl) then) =
      __$$IsConfirmPasswordObscureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsConfirmPasswordObscureImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$IsConfirmPasswordObscureImpl>
    implements _$$IsConfirmPasswordObscureImplCopyWith<$Res> {
  __$$IsConfirmPasswordObscureImplCopyWithImpl(
      _$IsConfirmPasswordObscureImpl _value,
      $Res Function(_$IsConfirmPasswordObscureImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IsConfirmPasswordObscureImpl
    with DiagnosticableTreeMixin
    implements _IsConfirmPasswordObscure {
  const _$IsConfirmPasswordObscureImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.isConfirmPasswordObscure()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'SignUpEvent.isConfirmPasswordObscure'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsConfirmPasswordObscureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) signWithGoogle,
    required TResult Function(BuildContext context) signWithApple,
    required TResult Function(
            String name, String email, String password, BuildContext context)
        signWithEmail,
    required TResult Function() isPasswordObscure,
    required TResult Function() isConfirmPasswordObscure,
    required TResult Function(double containerHeight) updateContainerHeight,
  }) {
    return isConfirmPasswordObscure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? signWithGoogle,
    TResult? Function(BuildContext context)? signWithApple,
    TResult? Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult? Function()? isPasswordObscure,
    TResult? Function()? isConfirmPasswordObscure,
    TResult? Function(double containerHeight)? updateContainerHeight,
  }) {
    return isConfirmPasswordObscure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? signWithGoogle,
    TResult Function(BuildContext context)? signWithApple,
    TResult Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult Function()? isPasswordObscure,
    TResult Function()? isConfirmPasswordObscure,
    TResult Function(double containerHeight)? updateContainerHeight,
    required TResult orElse(),
  }) {
    if (isConfirmPasswordObscure != null) {
      return isConfirmPasswordObscure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignWithGoogle value) signWithGoogle,
    required TResult Function(_SignWithApple value) signWithApple,
    required TResult Function(_SignWithEmail value) signWithEmail,
    required TResult Function(_IsPasswordObscure value) isPasswordObscure,
    required TResult Function(_IsConfirmPasswordObscure value)
        isConfirmPasswordObscure,
    required TResult Function(_UpdateContainerHeight value)
        updateContainerHeight,
  }) {
    return isConfirmPasswordObscure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignWithGoogle value)? signWithGoogle,
    TResult? Function(_SignWithApple value)? signWithApple,
    TResult? Function(_SignWithEmail value)? signWithEmail,
    TResult? Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult? Function(_IsConfirmPasswordObscure value)?
        isConfirmPasswordObscure,
    TResult? Function(_UpdateContainerHeight value)? updateContainerHeight,
  }) {
    return isConfirmPasswordObscure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignWithGoogle value)? signWithGoogle,
    TResult Function(_SignWithApple value)? signWithApple,
    TResult Function(_SignWithEmail value)? signWithEmail,
    TResult Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult Function(_IsConfirmPasswordObscure value)? isConfirmPasswordObscure,
    TResult Function(_UpdateContainerHeight value)? updateContainerHeight,
    required TResult orElse(),
  }) {
    if (isConfirmPasswordObscure != null) {
      return isConfirmPasswordObscure(this);
    }
    return orElse();
  }
}

abstract class _IsConfirmPasswordObscure implements SignUpEvent {
  const factory _IsConfirmPasswordObscure() = _$IsConfirmPasswordObscureImpl;
}

/// @nodoc
abstract class _$$UpdateContainerHeightImplCopyWith<$Res> {
  factory _$$UpdateContainerHeightImplCopyWith(
          _$UpdateContainerHeightImpl value,
          $Res Function(_$UpdateContainerHeightImpl) then) =
      __$$UpdateContainerHeightImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double containerHeight});
}

/// @nodoc
class __$$UpdateContainerHeightImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$UpdateContainerHeightImpl>
    implements _$$UpdateContainerHeightImplCopyWith<$Res> {
  __$$UpdateContainerHeightImplCopyWithImpl(_$UpdateContainerHeightImpl _value,
      $Res Function(_$UpdateContainerHeightImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? containerHeight = null,
  }) {
    return _then(_$UpdateContainerHeightImpl(
      containerHeight: null == containerHeight
          ? _value.containerHeight
          : containerHeight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UpdateContainerHeightImpl
    with DiagnosticableTreeMixin
    implements _UpdateContainerHeight {
  const _$UpdateContainerHeightImpl({required this.containerHeight});

  @override
  final double containerHeight;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.updateContainerHeight(containerHeight: $containerHeight)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpEvent.updateContainerHeight'))
      ..add(DiagnosticsProperty('containerHeight', containerHeight));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateContainerHeightImpl &&
            (identical(other.containerHeight, containerHeight) ||
                other.containerHeight == containerHeight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, containerHeight);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateContainerHeightImplCopyWith<_$UpdateContainerHeightImpl>
      get copyWith => __$$UpdateContainerHeightImplCopyWithImpl<
          _$UpdateContainerHeightImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) signWithGoogle,
    required TResult Function(BuildContext context) signWithApple,
    required TResult Function(
            String name, String email, String password, BuildContext context)
        signWithEmail,
    required TResult Function() isPasswordObscure,
    required TResult Function() isConfirmPasswordObscure,
    required TResult Function(double containerHeight) updateContainerHeight,
  }) {
    return updateContainerHeight(containerHeight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? signWithGoogle,
    TResult? Function(BuildContext context)? signWithApple,
    TResult? Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult? Function()? isPasswordObscure,
    TResult? Function()? isConfirmPasswordObscure,
    TResult? Function(double containerHeight)? updateContainerHeight,
  }) {
    return updateContainerHeight?.call(containerHeight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? signWithGoogle,
    TResult Function(BuildContext context)? signWithApple,
    TResult Function(
            String name, String email, String password, BuildContext context)?
        signWithEmail,
    TResult Function()? isPasswordObscure,
    TResult Function()? isConfirmPasswordObscure,
    TResult Function(double containerHeight)? updateContainerHeight,
    required TResult orElse(),
  }) {
    if (updateContainerHeight != null) {
      return updateContainerHeight(containerHeight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignWithGoogle value) signWithGoogle,
    required TResult Function(_SignWithApple value) signWithApple,
    required TResult Function(_SignWithEmail value) signWithEmail,
    required TResult Function(_IsPasswordObscure value) isPasswordObscure,
    required TResult Function(_IsConfirmPasswordObscure value)
        isConfirmPasswordObscure,
    required TResult Function(_UpdateContainerHeight value)
        updateContainerHeight,
  }) {
    return updateContainerHeight(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignWithGoogle value)? signWithGoogle,
    TResult? Function(_SignWithApple value)? signWithApple,
    TResult? Function(_SignWithEmail value)? signWithEmail,
    TResult? Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult? Function(_IsConfirmPasswordObscure value)?
        isConfirmPasswordObscure,
    TResult? Function(_UpdateContainerHeight value)? updateContainerHeight,
  }) {
    return updateContainerHeight?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignWithGoogle value)? signWithGoogle,
    TResult Function(_SignWithApple value)? signWithApple,
    TResult Function(_SignWithEmail value)? signWithEmail,
    TResult Function(_IsPasswordObscure value)? isPasswordObscure,
    TResult Function(_IsConfirmPasswordObscure value)? isConfirmPasswordObscure,
    TResult Function(_UpdateContainerHeight value)? updateContainerHeight,
    required TResult orElse(),
  }) {
    if (updateContainerHeight != null) {
      return updateContainerHeight(this);
    }
    return orElse();
  }
}

abstract class _UpdateContainerHeight implements SignUpEvent {
  const factory _UpdateContainerHeight(
      {required final double containerHeight}) = _$UpdateContainerHeightImpl;

  double get containerHeight;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateContainerHeightImplCopyWith<_$UpdateContainerHeightImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpState {
  bool get isPasswordObscure => throw _privateConstructorUsedError;
  bool get isConfirmNewPasswordObscure => throw _privateConstructorUsedError;
  double get containerHeight => throw _privateConstructorUsedError;
  SignUpStatus get signUpStatus => throw _privateConstructorUsedError;

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
  $Res call(
      {bool isPasswordObscure,
      bool isConfirmNewPasswordObscure,
      double containerHeight,
      SignUpStatus signUpStatus});
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
    Object? isPasswordObscure = null,
    Object? isConfirmNewPasswordObscure = null,
    Object? containerHeight = null,
    Object? signUpStatus = null,
  }) {
    return _then(_value.copyWith(
      isPasswordObscure: null == isPasswordObscure
          ? _value.isPasswordObscure
          : isPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmNewPasswordObscure: null == isConfirmNewPasswordObscure
          ? _value.isConfirmNewPasswordObscure
          : isConfirmNewPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      containerHeight: null == containerHeight
          ? _value.containerHeight
          : containerHeight // ignore: cast_nullable_to_non_nullable
              as double,
      signUpStatus: null == signUpStatus
          ? _value.signUpStatus
          : signUpStatus // ignore: cast_nullable_to_non_nullable
              as SignUpStatus,
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
  $Res call(
      {bool isPasswordObscure,
      bool isConfirmNewPasswordObscure,
      double containerHeight,
      SignUpStatus signUpStatus});
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
    Object? isPasswordObscure = null,
    Object? isConfirmNewPasswordObscure = null,
    Object? containerHeight = null,
    Object? signUpStatus = null,
  }) {
    return _then(_$SignUpStateImpl(
      isPasswordObscure: null == isPasswordObscure
          ? _value.isPasswordObscure
          : isPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmNewPasswordObscure: null == isConfirmNewPasswordObscure
          ? _value.isConfirmNewPasswordObscure
          : isConfirmNewPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      containerHeight: null == containerHeight
          ? _value.containerHeight
          : containerHeight // ignore: cast_nullable_to_non_nullable
              as double,
      signUpStatus: null == signUpStatus
          ? _value.signUpStatus
          : signUpStatus // ignore: cast_nullable_to_non_nullable
              as SignUpStatus,
    ));
  }
}

/// @nodoc

class _$SignUpStateImpl with DiagnosticableTreeMixin implements _SignUpState {
  const _$SignUpStateImpl(
      {this.isPasswordObscure = true,
      this.isConfirmNewPasswordObscure = true,
      this.containerHeight = 500,
      this.signUpStatus = SignUpStatus.initial});

  @override
  @JsonKey()
  final bool isPasswordObscure;
  @override
  @JsonKey()
  final bool isConfirmNewPasswordObscure;
  @override
  @JsonKey()
  final double containerHeight;
  @override
  @JsonKey()
  final SignUpStatus signUpStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState(isPasswordObscure: $isPasswordObscure, isConfirmNewPasswordObscure: $isConfirmNewPasswordObscure, containerHeight: $containerHeight, signUpStatus: $signUpStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState'))
      ..add(DiagnosticsProperty('isPasswordObscure', isPasswordObscure))
      ..add(DiagnosticsProperty(
          'isConfirmNewPasswordObscure', isConfirmNewPasswordObscure))
      ..add(DiagnosticsProperty('containerHeight', containerHeight))
      ..add(DiagnosticsProperty('signUpStatus', signUpStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.isPasswordObscure, isPasswordObscure) ||
                other.isPasswordObscure == isPasswordObscure) &&
            (identical(other.isConfirmNewPasswordObscure,
                    isConfirmNewPasswordObscure) ||
                other.isConfirmNewPasswordObscure ==
                    isConfirmNewPasswordObscure) &&
            (identical(other.containerHeight, containerHeight) ||
                other.containerHeight == containerHeight) &&
            (identical(other.signUpStatus, signUpStatus) ||
                other.signUpStatus == signUpStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPasswordObscure,
      isConfirmNewPasswordObscure, containerHeight, signUpStatus);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  const factory _SignUpState(
      {final bool isPasswordObscure,
      final bool isConfirmNewPasswordObscure,
      final double containerHeight,
      final SignUpStatus signUpStatus}) = _$SignUpStateImpl;

  @override
  bool get isPasswordObscure;
  @override
  bool get isConfirmNewPasswordObscure;
  @override
  double get containerHeight;
  @override
  SignUpStatus get signUpStatus;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
