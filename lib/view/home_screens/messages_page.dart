import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is LoadingMessagesStates) {
        const CircularProgressIndicator();
      }
    }, builder: (context, state) {
      return const Text(
        "messages",
        style: TextStyle(fontSize: 100, color: Colors.black),
      );
    });
  }
}
