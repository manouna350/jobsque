import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import '../model/widgets.dart';
import '../view_model/preferred_location/preferred_country.dart';
import '../view_model/preferred_location/preferred_location_selection_items.dart';

class PreferredLocation extends StatelessWidget {
  const PreferredLocation({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
              body: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouter.workType);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                      headline(text: "What is your preferred location?"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  normalText(
                      text:
                          "Let us know what is the location you want to work at this time, so we can adjust it ,"),
                  const SizedBox(height: 20),
                  const SelectLocation(),
                  const SizedBox(height: 20),
                  normalText(text: "Select the country you want to work in"),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SelectCountry(),
                        const SizedBox(height: 25),
                        defaultButton(
                            text: "Next",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouter.createSuccess);
                            })
                      ]),
                ]),
          )));
        });
  }
}
