import 'package:bloc/bloc.dart';
import 'package:chat_app/common/data_resources/data_resource.dart';
import 'package:chat_app/domain/entities/user_entity.dart';
import 'package:chat_app/domain/use%20cases/user_use_cases/get_user_usecase.dart';
import 'package:chat_app/domain/use%20cases/user_use_cases/sign_out_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final SignOutUsecase _signOutUseCase;
  final GetUserUsecase _getUserUseCase;

  HomeCubit(
    this._signOutUseCase,
    this._getUserUseCase,
  ) : super(const HomeState.initial());

  Future<void> signOut() async {
    await _signOutUseCase
        .invoke(
      input: null,
    )
        .then((value) {
      emit(state.copyWith(
        isUserLoggedIn: FirebaseAuth.instance.currentUser != null,
      ));
    });
  }

  void onTabTapped(int index) {
    emit(state.copyWith(currentButtomNavigationIndex: index));
    if (index == 0) {
      emit(state.copyWith(screenName: 'Chat Screen'));
    } else if (index == 1) {
      emit(state.copyWith(screenName: 'Request Screen'));
    } else {
      emit(state.copyWith(screenName: 'Profile Screen'));
    }

    switch (index) {
      case 0:
        emit(state.copyWith(screenName: 'Chat Screen'));
      case 1:
        emit(state.copyWith(screenName: 'Request Screen'));
      case 2:
        emit(state.copyWith(screenName: 'Profile Screen'));
      default:
        emit(state.copyWith(screenName: 'Answer It'));
    }
  }

  Future<void> getUserData() async {
    emit(state.copyWith(userResponse: const DataResource.loading()));
    await _getUserUseCase.invoke(
        callback: (resource) {
          emit(state.copyWith(userResponse: resource));
          debugPrint('Name : ${resource.data?.name}');
        },
        input: null);
  }
}
