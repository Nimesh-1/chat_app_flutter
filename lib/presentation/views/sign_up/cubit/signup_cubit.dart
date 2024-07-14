import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'Signup_state.dart';
part 'signup_cubit.freezed.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState.initial());

  final PageController pageController = PageController();
}
