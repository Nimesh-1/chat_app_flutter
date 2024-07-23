import 'package:chat_app/common/injection/injections.dart';
import 'package:chat_app/presentation/manager/route_manager.dart';
import 'package:chat_app/presentation/views/sign_up/cubit/signup_cubit.dart';
import 'package:chat_app/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var cubit = getIt<SignupCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Signup'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: cubit.nameController,
                      label: 'Name',
                      hintText: 'enter name',
                      errorText: state.nameError,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: cubit.emailController,
                      label: 'email',
                      hintText: 'enter email',
                      errorText: state.emailError,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      controller: cubit.passwordController,
                      label: 'password',
                      hintText: 'enter password',
                      errorText: state.passwordError,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      controller: cubit.dobController,
                      label: 'Dob',
                      hintText: 'enter Dob',
                      errorText: state.dobError,
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          var isLoggedIn = await cubit.createAccount();
                          if (isLoggedIn) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              MobileROutes.homeRoute,
                              (Route<dynamic> route) => false,
                            );
                          } else {
                            debugPrint('Something went wrong');
                          }
                        },
                        child: const Text('create'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
