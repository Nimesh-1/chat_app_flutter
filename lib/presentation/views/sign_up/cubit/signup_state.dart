part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const SignupState._();
  const factory SignupState.initial({
    @Default(null) String? nameError,
    @Default(null) String? emailError,
    @Default(null) String? passwordError,
    @Default(null) String? dobError,
  }) = _Initial;
}
