import 'package:chat_app/common/injection/injections.dart';
import 'package:chat_app/presentation/views/home/cubit/home_cubit.dart';
import 'package:chat_app/presentation/views/home/tabs/chat_screen.dart';
import 'package:chat_app/presentation/views/home/tabs/profile_screen.dart';
import 'package:chat_app/presentation/views/home/tabs/request_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var cubit = getIt<HomeCubit>();

class HomeScreen extends StatelessWidget {
  final List<Widget> _tabScreen = [
    const ChatScreen(),
    const RequestScreen(),
    ProfileScreen(cubit: cubit),
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
              title: Text(state.screenName),
            ),
            body: _tabScreen[state.currentButtomNavigationIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: cubit.onTabTapped,
              elevation: 20,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.blueGrey,
              currentIndex: state.currentButtomNavigationIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.request_quote),
                  label: 'Request',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
