import 'package:bloc/bloc.dart';
import 'package:chat_app/domain/use%20cases/user_use_cases/sign_out_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final SignOutUsecase _signOutUseCase;
  HomeCubit(this._signOutUseCase) : super(const HomeState.initial());

  Future<void> signOut() async {
    var signedOut = await _signOutUseCase.signout();

    emit(state.copyWith(isUserLoggedIn: !signedOut));
  }

  void onTabTapped(int index) {
    emit(state.copyWith(currentButtomNavigationIndex: index));
  }
}
