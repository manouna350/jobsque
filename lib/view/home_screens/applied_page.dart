import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/colors_themes/color_palette.dart';
import '../../model/cubit/app_cubit.dart';
import '../../model/cubit/app_states.dart';
import '../../model/widgets.dart';
import '../../view_model/builder_items/pages_builder_items.dart';

class AppliedPage extends StatefulWidget {
  const AppliedPage({super.key});

  @override
  State<AppliedPage> createState() => _AppliedPageState();
}

class _AppliedPageState extends State<AppliedPage> {
  bool active = false;
  bool rejected = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit.get(context);
          return Scaffold(
              body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                child: Center(child: headline2(text: "Applied")),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppTheme.boxColor,
                      borderRadius: BorderRadiusDirectional.circular(30)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            active = true;
                            rejected = false;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              color: active == true
                                  ? AppTheme.selectedSmallContainer
                                  : AppTheme.boxColor,
                              borderRadius:
                                  BorderRadiusDirectional.circular(30)),
                          child: Center(
                              child: Text(
                            "Active",
                            style: TextStyle(
                                color: active == true
                                    ? AppTheme.primaryColor
                                    : AppTheme.sentence),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            active = false;
                            rejected = true;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              color: rejected == true
                                  ? AppTheme.selectedSmallContainer
                                  : AppTheme.boxColor,
                              borderRadius:
                                  BorderRadiusDirectional.circular(30)),
                          child: Center(
                              child: Text(
                            "Rejected",
                            style: TextStyle(
                                color: rejected == true
                                    ? AppTheme.primaryColor
                                    : AppTheme.sentence),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: AppliedItems(
                  listItem: AppCubit.get(context).jobList,
                  active: active,
                  rejected: rejected,
                ),
              ),
            ],
          ));
        });
  }
}
