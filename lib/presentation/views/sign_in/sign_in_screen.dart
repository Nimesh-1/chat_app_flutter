import 'package:chat_app/common/injection/injections.dart';
import 'package:chat_app/presentation/manager/route_manager.dart';
import 'package:chat_app/presentation/views/sign_in/cubit/signin_cubit.dart';
import 'package:chat_app/presentation/views/widgets/custom_button.dart';
import 'package:chat_app/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  var cubit = getIt<SigninCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: cubit.emailController,
                  label: 'email',
                  hintText: 'enter email',
                ),
                const SizedBox(height: 16),
                BlocBuilder<SigninCubit, SigninState>(
                  builder: (context, state) {
                    return CustomTextField(
                      controller: cubit.passwordController,
                      label: 'Password',
                      hintText: 'enter Password',
                      isPasswordHidden: state.isPasswordHidden,
                      onPasswordIconTap: cubit.passwordIconToggle,
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<SigninCubit, SigninState>(
                  builder: (context, state) {
                    return CustomButton(
                      onTap: () async {
                        await cubit.signInUser();
                        debugPrint(state.signInResource.data?.user?.uid);
                        if (state.signInResource.isSuccess()) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              MobileROutes.homeRoute,
                              (Route<dynamic> route) => false);
                        } else if (state.signInResource.isError()) {
                          debugPrint(state.signInResource.failure?.message);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                state.signInResource.failure?.message ?? ''),
                            backgroundColor: Colors.green,
                            elevation: 2,
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.all(16),
                          ));
                        }
                      },
                      isLoading: state.signInResource.isLoading(),
                      buttonText: 'sign In',
                      buttonColor: Colors.blueAccent.shade100,
                    );
                  },
                  // child: CustomButton(
                  //   onTap: () async {
                  //     var isLoggedIn = await cubit.signInUser();
                  //   if (isLoggedIn == 'SignIn success') {
                  //     Navigator.of(context).pushNamedAndRemoveUntil(
                  //       MobileROutes.homeRoute,
                  //       (Route<dynamic> route) => false,
                  //     );
                  //   } else {
                  //     debugPrint(isLoggedIn);
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //       content: Text(isLoggedIn),
                  //       backgroundColor: Colors.green,
                  //       elevation: 2,
                  //       behavior: SnackBarBehavior.floating,
                  //       margin: EdgeInsets.all(5),
                  //     ));
                  //   }
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
