import 'package:chat_app/presentation/manager/route_manager.dart';
import 'package:chat_app/presentation/views/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';

Widget mainUI({required LoginCubit cubit, required BuildContext context}) {
  final List<Color> backgroundcolorList = [
    Colors.redAccent,
    Colors.lightBlueAccent,
    Colors.greenAccent,
  ];
  return Stack(
    children: [
      PageView.builder(
        controller: cubit.pageController,
        itemCount: backgroundcolorList.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: backgroundcolorList[index],
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(MobileROutes.signInRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Sign In'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(MobileROutes.signUpRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
