import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  void isUserLoggedIn() async {
    var user = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isUserLoggedIn: user != null));
    // if (user != null) {
    //   Navigator.of(context)
    //       .pushNamedAndRemoveUntil(MobileROutes.signUpRoute, (route) => false);
    // }
  }
}
