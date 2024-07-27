import 'package:bloc/bloc.dart';
import 'package:chat_app/common/data_resources/data_resource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use cases/user_use_cases/sign_in_usecase.dart';

part 'signin_state.dart';
part 'signin_cubit.freezed.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this._signInUseCase) : super(const SigninState.initial());

  final SignInUsecase _signInUseCase;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signInUser() async {
    if (emailController.text.isEmpty) {
      emit(state.copyWith(emailError: 'email cant be empty'));
    }
    if (passwordController.text.isEmpty) {
      emit(state.copyWith(passwordError: 'password cant be empty'));
    }

    emit(state.copyWith(signInResource: const DataResource.loading()));
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // var isSignedIn = await _signInUseCase.signinWithEmailPassword(
      //     emailController.text, passwordController.text);
      // return isSignedIn;
      _signInUseCase.invoke(
        callback: (resource) {
          emit(state.copyWith(signInResource: resource));
        },
        input:
            SignInWithEmailInput(emailController.text, passwordController.text),
      );
    } else {
      debugPrint('Enter email and Password');
      emit(state.copyWith(signInResource: const DataResource.inital()));
    }
  }

  void passwordIconToggle() {
    emit(state.copyWith(isPasswordHidden: !state.isPasswordHidden));
  }
}
