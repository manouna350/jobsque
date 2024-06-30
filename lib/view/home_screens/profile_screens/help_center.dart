import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';

import '../../../model/widgets.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
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
              title: headline(text: "Help center"),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  searchField(
                      controller: AppCubit.get(context).search,
                      hintText: "How can we help?"),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      childrenPadding: const EdgeInsets.all(10),
                      backgroundColor: Colors.transparent,
                      initiallyExpanded: false,
                      iconColor: Colors.grey,
                      collapsedIconColor: Colors.grey,
                      title: headline2(text: "Nterdum porttitor eget  "),
                      controlAffinity: ListTileControlAffinity.trailing,
                      children: [
                        normalText(
                            text:
                                " laoreet ante non venenatis rhoncus , ut commodo nisi bibendum eget. Quisque elementum aliquet magna rutrum auctor. Suspendisse eget nibh ut mauris tincidunt tristique eget vel augue. Nam ipsum nisi, condimentum et placerat ut, cursus id ex. Morbi at ante elementum, ultrices lectus scelerisque, accumsan nisi. Nunc libero lacus, eleifend a tempor et, rhoncus quis nunc.")
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      childrenPadding: const EdgeInsets.all(10),
                      backgroundColor: Colors.transparent,
                      initiallyExpanded: false,
                      iconColor: Colors.grey,
                      collapsedIconColor: Colors.grey,
                      title: headline2(text: "ante non venenatis rhoncus"),
                      controlAffinity: ListTileControlAffinity.trailing,
                      children: [
                        normalText(
                            text:
                                " laoreet ante non venenatis rhoncus , ut commodo nisi bibendum eget. Quisque elementum aliquet magna rutrum auctor. Suspendisse eget nibh ut mauris tincidunt tristique eget vel augue. Nam ipsum nisi, condimentum et placerat ut, cursus id ex. Morbi at ante elementum, ultrices lectus scelerisque, accumsan nisi. Nunc libero lacus, eleifend a tempor et, rhoncus quis nunc.")
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      childrenPadding: const EdgeInsets.all(10),
                      backgroundColor: Colors.transparent,
                      initiallyExpanded: false,
                      iconColor: Colors.grey,
                      collapsedIconColor: Colors.grey,
                      title: headline2(text: "laoreet ante non venenatis"),
                      controlAffinity: ListTileControlAffinity.trailing,
                      children: [
                        normalText(
                            text:
                                " laoreet ante non venenatis rhoncus , ut commodo nisi bibendum eget. Quisque elementum aliquet magna rutrum auctor. Suspendisse eget nibh ut mauris tincidunt tristique eget vel augue. Nam ipsum nisi, condimentum et placerat ut, cursus id ex. Morbi at ante elementum, ultrices lectus scelerisque, accumsan nisi. Nunc libero lacus, eleifend a tempor et, rhoncus quis nunc.")
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      childrenPadding: const EdgeInsets.all(10),
                      backgroundColor: Colors.transparent,
                      initiallyExpanded: false,
                      iconColor: Colors.grey,
                      collapsedIconColor: Colors.grey,
                      title: headline2(text: "tristique eget vel augue"),
                      controlAffinity: ListTileControlAffinity.trailing,
                      children: [
                        normalText(
                            text:
                                " laoreet ante non venenatis rhoncus , ut commodo nisi bibendum eget. Quisque elementum aliquet magna rutrum auctor. Suspendisse eget nibh ut mauris tincidunt tristique eget vel augue. Nam ipsum nisi, condimentum et placerat ut, cursus id ex. Morbi at ante elementum, ultrices lectus scelerisque, accumsan nisi. Nunc libero lacus, eleifend a tempor et, rhoncus quis nunc.")
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      childrenPadding: const EdgeInsets.all(10),
                      backgroundColor: Colors.transparent,
                      initiallyExpanded: false,
                      iconColor: Colors.grey,
                      collapsedIconColor: Colors.grey,
                      title: headline2(text: "commodo nisi bibendum eget"),
                      controlAffinity: ListTileControlAffinity.trailing,
                      children: [
                        normalText(
                            text:
                                " laoreet ante non venenatis rhoncus , ut commodo nisi bibendum eget. Quisque elementum aliquet magna rutrum auctor. Suspendisse eget nibh ut mauris tincidunt tristique eget vel augue. Nam ipsum nisi, condimentum et placerat ut, cursus id ex. Morbi at ante elementum, ultrices lectus scelerisque, accumsan nisi. Nunc libero lacus, eleifend a tempor et, rhoncus quis nunc.")
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      childrenPadding: const EdgeInsets.all(10),
                      backgroundColor: Colors.transparent,
                      initiallyExpanded: false,
                      iconColor: Colors.grey,
                      collapsedIconColor: Colors.grey,
                      title: headline2(text: "ultrices lectus scelerisque"),
                      controlAffinity: ListTileControlAffinity.trailing,
                      children: [
                        normalText(
                            text:
                                " laoreet ante non venenatis rhoncus , ut commodo nisi bibendum eget. Quisque elementum aliquet magna rutrum auctor. Suspendisse eget nibh ut mauris tincidunt tristique eget vel augue. Nam ipsum nisi, condimentum et placerat ut, cursus id ex. Morbi at ante elementum, ultrices lectus scelerisque, accumsan nisi. Nunc libero lacus, eleifend a tempor et, rhoncus quis nunc.")
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          );
        });
  }
}
