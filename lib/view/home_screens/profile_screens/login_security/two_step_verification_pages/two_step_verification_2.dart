import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';

import '../../../../../model/colors_themes/color_palette.dart';
import '../../../../../model/widgets.dart';
import '../../../../../view_model/routes/route_name.dart';

class TwoStepVerification2 extends StatefulWidget {
  const TwoStepVerification2({super.key});

  @override
  State<TwoStepVerification2> createState() => _TwoStepVerification2State();
}

class _TwoStepVerification2State extends State<TwoStepVerification2> {
  bool switchOn = true;
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
              body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                          headline3(text: "select a verification method"),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3))),
                            child: ExpansionTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              childrenPadding: const EdgeInsets.all(10),
                              backgroundColor: Colors.transparent,
                              initiallyExpanded: false,
                              iconColor: Colors.grey,
                              collapsedIconColor: Colors.grey,
                              title:
                                  headline4(text: "Telephone number (SMS)  "),
                              controlAffinity: ListTileControlAffinity.trailing,
                              children: [normalText(text: "")],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          normalText(
                              text:
                                  "Note: turning this feature will sign you out anywhere\n you are currently signed in. we will then require you\n to enter a verification code the first time you sign in \nwith a new device or a joby mobile application."),
                          const SizedBox(height: 200),
                          defaultButton(
                              text: "Next",
                              onPressed: () {
                                if (switchOn == true) {
                                  Navigator.pushNamed(
                                      context, AppRouter.twoStepVerification3);
                                } else {
                                  null;
                                }
                              })
                        ])),
              ));
        });
  }
}
