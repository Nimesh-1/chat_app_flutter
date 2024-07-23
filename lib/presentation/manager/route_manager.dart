import 'package:chat_app/presentation/views/home/home_screen.dart';
import 'package:chat_app/presentation/views/login/login_screen.dart';
import 'package:chat_app/presentation/views/sign_in/sign_in_screen.dart';
import 'package:chat_app/presentation/views/sign_up/sign_up_screen.dart';
import 'package:chat_app/presentation/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Route<dynamic> ongenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MobileROutes.initialroute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case MobileROutes.loginroute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case MobileROutes.signInRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case MobileROutes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case MobileROutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
    }
  }
}

class MobileROutes {
  static const String initialroute = '/';
  static const String loginroute = '/login';
  static const String signInRoute = '/signIn';
  static const String signUpRoute = '/signUp';
  static const String homeRoute = '/home';
}
