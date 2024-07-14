import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'signin_state.dart';
part 'signin_cubit.freezed.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(const SigninState.initial());

  final PageController pageController = PageController();
}
