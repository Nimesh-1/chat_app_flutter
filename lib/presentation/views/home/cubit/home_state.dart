part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState.initial(
      {@Default(true) bool isUserLoggedIn,
      @Default(0) int currentButtomNavigationIndex,
      @Default('Chat Screen') String screenName,
      @Default(DataResource.inital())
      DataResource<UserEntity> userResponse}) = _Initial;
}
