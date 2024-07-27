import 'package:chat_app/common/injection/injections.dart';
import 'package:chat_app/presentation/manager/route_manager.dart';
import 'package:chat_app/presentation/views/sign_in/cubit/signin_cubit.dart';
import 'package:chat_app/presentation/views/widgets/custom_button.dart';
import 'package:chat_app/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final SigninCubit cubit = getIt<SigninCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocConsumer<SigninCubit, SigninState>(
            listener: (context, state) {
              if (state.signInResource.isSuccess()) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  MobileROutes.homeRoute,
                  (Route<dynamic> route) => false,
                );
              } else if (state.signInResource.isError()) {
                _showErrorSnackBar(
                  context,
                  state.signInResource.failure?.message ?? 'Sign in failed',
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: cubit.emailController,
                      label: 'Email',
                      hintText: 'Enter email',
                      errorText: state.emailError,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: cubit.passwordController,
                      label: 'Password',
                      hintText: 'Enter password',
                      isPasswordHidden: state.isPasswordHidden,
                      onPasswordIconTap: cubit.passwordIconToggle,
                      errorText: state.passwordError,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      onTap: () async {
                        if (!cubit.isClosed) {
                          try {
                            await cubit.signInUser();
                          } catch (e) {
                            debugPrint('Error during sign in: $e');
                            _showErrorSnackBar(
                                context, 'An error occurred while signing in');
                          }
                        }
                      },
                      isLoading: state.signInResource.isLoading(),
                      buttonText: 'Sign In',
                      buttonColor: Colors.blueAccent.shade100,
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

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Something went wrong'),
      backgroundColor: Colors.redAccent,
      elevation: 2,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
    ));
  }
}
