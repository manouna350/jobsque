import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import '../../../model/colors_themes/color_palette.dart';
import '../../../model/widgets.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool switchOn = false;
  bool switchOn1 = false;
  bool switchOn2 = false;
  bool switchOn3 = false;
  bool switchOn4 = false;
  bool switchOn5 = false;
  bool switchOn6 = false;
  bool switchOn7 = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(context);
                },
              ),
              centerTitle: true,
              title: headline(text: "Notifications"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  title(text: "Job notification"),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headline4(text: "Your job Search alert"),
                              const SizedBox(
                                width: 100,
                              ),
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
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headline4(text: "Job application update"),
                              const SizedBox(
                                width: 130,
                              ),
                              CupertinoSwitch(
                                  value: switchOn1,
                                  activeColor: AppTheme.buttonColor,
                                  onChanged: (bool switchOff) {
                                    setState(() {
                                      switchOn1 = switchOff;
                                    });
                                  })
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headline4(text: "Job application reminders"),
                              const SizedBox(
                                width: 100,
                              ),
                              CupertinoSwitch(
                                  value: switchOn2,
                                  activeColor: AppTheme.buttonColor,
                                  onChanged: (bool switchOff) {
                                    setState(() {
                                      switchOn2 = switchOff;
                                    });
                                  })
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headline4(text: "Jobs you may be interested in"),
                              const SizedBox(
                                width: 50,
                              ),
                              CupertinoSwitch(
                                  value: switchOn3,
                                  activeColor: AppTheme.buttonColor,
                                  onChanged: (bool switchOff) {
                                    setState(() {
                                      switchOn3 = switchOff;
                                    });
                                  })
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headline4(text: "Job seeker updates"),
                              const SizedBox(
                                width: 100,
                              ),
                              CupertinoSwitch(
                                  value: switchOn4,
                                  activeColor: AppTheme.buttonColor,
                                  onChanged: (bool switchOff) {
                                    setState(() {
                                      switchOn4 = switchOff;
                                    });
                                  })
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  title(text: "Other notifications"),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headline4(text: "Show profile"),
                              const SizedBox(
                                width: 100,
                              ),
                              CupertinoSwitch(
                                  value: switchOn5,
                                  activeColor: AppTheme.buttonColor,
                                  onChanged: (bool switchOff) {
                                    setState(() {
                                      switchOn5 = switchOff;
                                    });
                                  })
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headline4(text: "All messages"),
                              const SizedBox(
                                width: 100,
                              ),
                              CupertinoSwitch(
                                  value: switchOn6,
                                  activeColor: AppTheme.buttonColor,
                                  onChanged: (bool switchOff) {
                                    setState(() {
                                      switchOn6 = switchOff;
                                    });
                                  })
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headline4(text: "Message nudges"),
                              const SizedBox(
                                width: 100,
                              ),
                              CupertinoSwitch(
                                  value: switchOn7,
                                  activeColor: AppTheme.buttonColor,
                                  onChanged: (bool switchOff) {
                                    setState(() {
                                      switchOn7 = switchOff;
                                    });
                                  })
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
