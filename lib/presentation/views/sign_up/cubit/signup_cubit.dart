import 'package:bloc/bloc.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/domain/use%20cases/user_use_cases/sign_up_usecase.dart';
import 'package:chat_app/domain/use%20cases/user_use_cases/update_user_usecase.dart';
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

  Future<bool> createAccount() async {
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
      var isRegister = await _signUpUsecase.signUpWithEmailPassword(
          emailController.text, passwordController.text);

      if (isRegister == true) {
        return await _updateUserUsecase.updateUser(UserModel(
            name: nameController.text,
            email: emailController.text,
            dob: dobController.text));
      } else {
        debugPrint('Account not created');
        return false;
      }
    } else {
      debugPrint('Enter email and Password');
      return false;
    }
  }
}
