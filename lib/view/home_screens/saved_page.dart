import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/widgets.dart';
import '../../model/cubit/app_cubit.dart';
import '../../model/cubit/app_states.dart';
import '../../view_model/builder_items/pages_builder_items.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      return Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Center(child: headline2(text: "Saved")),
          ),
          SavedItems(
            listItem: AppCubit.get(context).jobList,
          ),
        ],
      ));
    });
  }
}
