import 'package:chat_app/common/injections.dart';
import 'package:chat_app/presentation/manager/route_manager.dart';
import 'package:chat_app/presentation/views/sign_up/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var cubit = getIt<SignupCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: cubit.nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                ),
              ),
              const SizedBox(height: 16),
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
              TextField(
                controller: cubit.dobController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter DoB',
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 16),
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
        ),
      ),
    );
  }
}
