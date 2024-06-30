import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/builder_items/grid_item.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import '../model/cubit/app_cubit.dart';
import '../model/cubit/app_states.dart';
import '../model/widgets.dart';

class WorkType extends StatelessWidget {
  const WorkType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 20, right: 20, bottom: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRouter.createAccount);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          headline(
                              text:
                                  "What type of work are you \ninterested in?")
                        ]),
                    const SizedBox(height: 10),
                    normalText(
                        text:
                            "Tell us what you are interested in so we can customize the app for your needs."),
                    const SizedBox(height: 10),
                    const GridItem(),
                    const SizedBox(height: 20),
                    defaultButton(
                        text: "Next",
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRouter.preferredLocation);
                        })
                  ]),
            ),
          ));
        });
  }
}
