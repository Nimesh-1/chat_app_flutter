import 'package:chat_app/common/injection/injections.dart';
import 'package:chat_app/presentation/manager/route_manager.dart';
import 'package:chat_app/presentation/views/sign_in/cubit/signin_cubit.dart';
import 'package:chat_app/presentation/views/widgets/custom_button.dart';
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
          title: const Text('Signup'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: cubit.emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter E-mail',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: cubit.passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password',
                  ),
                  keyboardType: TextInputType.visiblePassword,
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
