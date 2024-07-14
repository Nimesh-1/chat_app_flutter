part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();

  const factory LoginState.initial({
    @Default(0) int count,
    @Default(0) String name,
  }) = _initial;
}
