import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';

import '../model/cubit/auth_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SignInLoading) {
          const CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: AppCubit.screens[AppCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: AppCubit.get(context).currentIndex,
            onTap: (index) {
              setState(() {
                AppCubit.get(context).bottomNavBar(index);
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat), label: "Messages"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.cases_rounded), label: "Applied"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmarks), label: "Saved"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}
