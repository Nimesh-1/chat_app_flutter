import 'package:bloc/bloc.dart';
import 'package:chat_app/common/data_resources/data_resource.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/domain/use%20cases/user_use_cases/sign_up_usecase.dart';
import 'package:chat_app/domain/use%20cases/user_use_cases/update_user_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signUpUsecase, this._updateUserUsecase)
      : super(const SignupState.initial());

  final SignUpUsecase _signUpUsecase;
  final UpdateUserUsecase _updateUserUsecase;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  Future<void> createAccount() async {
    if (nameController.text.isEmpty) {
      emit(state.copyWith(nameError: 'Name cant be empty'));
    }
    if (emailController.text.isEmpty) {
      emit(state.copyWith(emailError: 'email cant be empty'));
    }
    if (passwordController.text.isEmpty) {
      emit(state.copyWith(passwordError: 'password cant be empty'));
    }
    if (dobController.text.isEmpty) {
      emit(state.copyWith(dobError: 'Dob cant be empty'));
    }
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        dobController.text.isNotEmpty) {
      await _signUpUsecase.invoke(
        callback: (signUpResponse) async {
          if (signUpResponse.isSuccess()) {
            await _updateUserUsecase.invoke(
              callback: (response) {
                if (response.isSuccess()) {
                  emit(state.copyWith(signUpResource: signUpResponse));
                }
              },
              input: UpdateUserInput(
                UserModel(
                  name: nameController.text,
                  email: emailController.text,
                  dob: dobController.text,
                ),
                signUpResponse.data?.user?.uid ?? "",
              ),
            );
          }
        },
        input: SignUpWithEmailInput(
          emailController.text,
          passwordController.text,
        ),
      );
    } else {
      debugPrint('Enter email or password');
    }
  }
}
