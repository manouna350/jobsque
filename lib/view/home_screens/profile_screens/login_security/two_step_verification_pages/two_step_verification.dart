import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import 'package:jobsque/view_model/routes/route_name.dart';

import '../../../../../model/colors_themes/color_palette.dart';
import '../../../../../model/widgets.dart';

class TwoStepVerification1 extends StatefulWidget {
  const TwoStepVerification1({super.key});

  @override
  State<TwoStepVerification1> createState() => _TwoStepVerification1State();
}

class _TwoStepVerification1State extends State<TwoStepVerification1> {
  bool switchOn = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop(context);
                  },
                ),
                centerTitle: true,
                title: headline(text: "Two-step verification"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Container(
                      height: 70,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppTheme.borderColor,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            normalText2(
                                text:
                                    "secure your account with \ntwo step verification"),
                            CupertinoSwitch(
                                value: switchOn,
                                activeColor: AppTheme.buttonColor,
                                onChanged: (bool switchOff) {
                                  setState(() {
                                    switchOn = switchOff;
                                  });
                                })
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: AppTheme.clickedBoxColor,
                        radius: 25,
                        child: Icon(
                          Icons.lock_outline,
                          color: AppTheme.buttonColor,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          child: normalText(
                              text:
                                  "Two-step verification provides additional\n security by asking for a verification code \neverytime you log in on another device")),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: AppTheme.clickedBoxColor,
                        radius: 25,
                        child: Icon(
                          Icons.phone_android_outlined,
                          color: AppTheme.buttonColor,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          child: normalText(
                              text:
                                  "Adding a phone number or using an\nauthenticator will help your account\nsafe from harm")),
                    ],
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  defaultButton(
                      text: "Next",
                      onPressed: () {
                        if (switchOn == true) {
                          Navigator.pushNamed(
                              context, AppRouter.twoStepVerification2);
                        } else {
                          null;
                        }
                      })
                ]),
              ));
        });
  }
}
