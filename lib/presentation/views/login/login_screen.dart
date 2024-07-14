import 'package:chat_app/common/injections.dart';
import 'package:chat_app/presentation/views/login/cubit/login_cubit.dart';
import 'package:chat_app/presentation/views/widgets/main_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final cubit = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return cubit;
      },
      child: Scaffold(
        body: mainUI(cubit: cubit, context: context),
      ),
    );
  }
}
