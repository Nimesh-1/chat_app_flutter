import 'package:chat_app/common/injection/injections.dart';
import 'package:chat_app/presentation/manager/route_manager.dart';
import 'package:chat_app/presentation/views/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var cubit = getIt<HomeCubit>();

class HomeScreen extends StatelessWidget {
  final List<Widget> _children = [
    Tab1(),
    Tab2(),
    Tab3(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: const Text('Chat_app '),
            ),
            body: _children[state.currentButtomNavigationIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: cubit.onTabTapped,
              currentIndex: state.currentButtomNavigationIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'tab 1',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'tab 2',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'tab 3',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tab 1 Content'),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tab 2 Content'),
    );
  }
}

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Welcome'),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) {
            return previous.isUserLoggedIn != current.isUserLoggedIn;
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () async {
                await cubit.signOut();
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
        ),
      ],
    );
  }
}
