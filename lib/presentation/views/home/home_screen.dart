import 'package:chat_app/common/injections.dart';
import 'package:chat_app/presentation/manager/route_manager.dart';
import 'package:chat_app/presentation/views/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var cubit = getIt<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('home page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome'),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) {
                return previous.isUserLoggedIn != current.isUserLoggedIn;
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    cubit.signOut();
                    if (!(state.isUserLoggedIn)) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MobileROutes.loginroute, (route) => false);
                    } else {
                      debugPrint('Something went wrong...');
                    }
                  },
                  child: const Text('Sign Out'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
