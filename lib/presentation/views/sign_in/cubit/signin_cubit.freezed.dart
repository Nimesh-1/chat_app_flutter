// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SigninState {
  DataResource<UserCredential> get signInResource =>
      throw _privateConstructorUsedError;
  bool get isPasswordHidden => throw _privateConstructorUsedError;
  String? get emailError => throw _privateConstructorUsedError;
  String? get passwordError => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DataResource<UserCredential> signInResource,
            bool isPasswordHidden, String? emailError, String? passwordError)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DataResource<UserCredential> signInResource,
            bool isPasswordHidden, String? emailError, String? passwordError)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DataResource<UserCredential> signInResource,
            bool isPasswordHidden, String? emailError, String? passwordError)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SigninStateCopyWith<SigninState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigninStateCopyWith<$Res> {
  factory $SigninStateCopyWith(
          SigninState value, $Res Function(SigninState) then) =
      _$SigninStateCopyWithImpl<$Res, SigninState>;
  @useResult
  $Res call(
      {DataResource<UserCredential> signInResource,
      bool isPasswordHidden,
      String? emailError,
      String? passwordError});
}

/// @nodoc
class _$SigninStateCopyWithImpl<$Res, $Val extends SigninState>
    implements $SigninStateCopyWith<$Res> {
  _$SigninStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signInResource = null,
    Object? isPasswordHidden = null,
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(_value.copyWith(
      signInResource: null == signInResource
          ? _value.signInResource
          : signInResource // ignore: cast_nullable_to_non_nullable
              as DataResource<UserCredential>,
      isPasswordHidden: null == isPasswordHidden
          ? _value.isPasswordHidden
          : isPasswordHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SigninStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataResource<UserCredential> signInResource,
      bool isPasswordHidden,
      String? emailError,
      String? passwordError});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signInResource = null,
    Object? isPasswordHidden = null,
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(_$InitialImpl(
      signInResource: null == signInResource
          ? _value.signInResource
          : signInResource // ignore: cast_nullable_to_non_nullable
              as DataResource<UserCredential>,
      isPasswordHidden: null == isPasswordHidden
          ? _value.isPasswordHidden
          : isPasswordHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      {this.signInResource = const DataResource.inital(),
      this.isPasswordHidden = true,
      this.emailError = null,
      this.passwordError = null})
      : super._();

  @override
  @JsonKey()
  final DataResource<UserCredential> signInResource;
  @override
  @JsonKey()
  final bool isPasswordHidden;
  @override
  @JsonKey()
  final String? emailError;
  @override
  @JsonKey()
  final String? passwordError;

  @override
  String toString() {
    return 'SigninState.initial(signInResource: $signInResource, isPasswordHidden: $isPasswordHidden, emailError: $emailError, passwordError: $passwordError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.signInResource, signInResource) ||
                other.signInResource == signInResource) &&
            (identical(other.isPasswordHidden, isPasswordHidden) ||
                other.isPasswordHidden == isPasswordHidden) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, signInResource, isPasswordHidden, emailError, passwordError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DataResource<UserCredential> signInResource,
            bool isPasswordHidden, String? emailError, String? passwordError)
        initial,
  }) {
    return initial(signInResource, isPasswordHidden, emailError, passwordError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DataResource<UserCredential> signInResource,
            bool isPasswordHidden, String? emailError, String? passwordError)?
        initial,
  }) {
    return initial?.call(
        signInResource, isPasswordHidden, emailError, passwordError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DataResource<UserCredential> signInResource,
            bool isPasswordHidden, String? emailError, String? passwordError)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          signInResource, isPasswordHidden, emailError, passwordError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends SigninState {
  const factory _Initial(
      {final DataResource<UserCredential> signInResource,
      final bool isPasswordHidden,
      final String? emailError,
      final String? passwordError}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  DataResource<UserCredential> get signInResource;
  @override
  bool get isPasswordHidden;
  @override
  String? get emailError;
  @override
  String? get passwordError;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
