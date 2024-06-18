import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import 'package:jobsque/view/home_screens/home_page.dart';
import 'home_screens/applied_page.dart';
import 'home_screens/messages_page.dart';
import 'home_screens/profile_page.dart';
import 'home_screens/saved_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static List<Widget> screens = [
    const HomePage(),
    const MessagesPage(),
    const AppliedPage(),
    const SavedPage(),
    const ProfilePage(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
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
