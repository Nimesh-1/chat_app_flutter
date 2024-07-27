part of 'signin_cubit.dart';

@freezed
class SigninState with _$SigninState {
  const SigninState._();

  const factory SigninState.initial({
    @Default(DataResource.inital()) DataResource<UserCredential> signInResource,
    @Default(true) bool isPasswordHidden,
    @Default(null) String? emailError,
    @Default(null) String? passwordError,
  }) = _Initial;
}
