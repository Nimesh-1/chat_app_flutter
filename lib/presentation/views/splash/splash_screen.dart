import 'package:chat_app/common/injection/injections.dart';
import 'package:chat_app/presentation/manager/json_manager.dart';
import 'package:chat_app/presentation/manager/route_manager.dart';
import 'package:chat_app/presentation/views/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  var cubit = getIt<SplashCubit>();

  @override
  Widget build(BuildContext context) {
    // cubit.isUserLoggedIn();
    return BlocProvider(
      create: (context) {
        cubit.isUserLoggedIn();
        return cubit;
      },
      lazy: false,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 1, 16, 59),
        body: BlocListener<SplashCubit, SplashState>(
            listener: (context, state) {
              if (state.isUserLoggedIn) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    MobileROutes.homeRoute, (route) => false);
              } else {
                debugPrint('hello errr');
                Navigator.of(context).pushNamedAndRemoveUntil(
                    MobileROutes.loginroute, (route) => false);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  JsonManager.helloJson,
                ),
                const Text(
                  'Hello, there',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                )
              ],
            )),
      ),
    );
  }
}
