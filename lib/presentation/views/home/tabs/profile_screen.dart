import 'package:chat_app/presentation/manager/route_manager.dart';
import 'package:chat_app/presentation/views/home/cubit/home_cubit.dart';
import 'package:chat_app/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.cubit});

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (p, c) {
              return p.userResponse != c.userResponse;
            },
            builder: (context, state) {
              return Column(
                children: [
                  Text(
                    state.userResponse.data?.name ?? 'no Text',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    state.userResponse.data?.email ?? 'no Text',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    state.userResponse.data?.dob ?? 'no Text',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              );
            },
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (p, c) {
              // return p.isUserLoggedIn != c.isUserLoggedIn;
              return true;
            },
            builder: (context, state) {
              return CustomButton(
                onTap: () async {
                  await cubit.signOut().then((value) {
                    if (!(state.isUserLoggedIn)) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MobileROutes.loginroute, (route) => false);
                    } else {
                      debugPrint(
                          'Something went wrong:${state.isUserLoggedIn}');
                    }
                  });
                },
                buttonText: 'Log out',
              );
            },
          )
        ],
      ),
    );
  }
}
