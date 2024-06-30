import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/colors_themes/color_palette.dart';
import '../../model/cubit/app_cubit.dart';
import '../../model/cubit/app_states.dart';
import '../../model/widgets.dart';
import '../../view_model/builder_items/pages_builder_items.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  GlobalKey<FormState> msgForm = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: headline2(text: "Messages"),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: msgForm,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 90,
                          width: 340,
                          child: searchField(
                              controller: AppCubit.get(context).search,
                              hintText: "Search messages..."),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: AppTheme.borderColor)),
                          child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    barrierColor: Colors.black.withOpacity(0.7),
                                    showDragHandle: true,
                                    enableDrag: true,
                                    elevation: 2,
                                    builder: (BuildContext context) {
                                      return Container(
                                          height: 280,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(15)),
                                          child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    headline2(
                                                        text:
                                                            "Message filters"),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: 50,
                                                            width: double
                                                                .maxFinite,
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: AppTheme
                                                                          .borderColor,
                                                                    )),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    const Text(
                                                                      "Unread",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {},
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .arrow_forward,
                                                                          color:
                                                                              Colors.black,
                                                                        ))
                                                                  ]),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 20),
                                                          Container(
                                                            height: 50,
                                                            width: double
                                                                .maxFinite,
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: AppTheme
                                                                          .borderColor,
                                                                    )),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    const Text(
                                                                      "Spam",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {},
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .arrow_forward,
                                                                          color:
                                                                              Colors.black,
                                                                        ))
                                                                  ]),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 20),
                                                          Container(
                                                            height: 50,
                                                            width: double
                                                                .maxFinite,
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: AppTheme
                                                                          .borderColor,
                                                                    )),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    const Text(
                                                                      "Archived",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {},
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .arrow_forward,
                                                                          color:
                                                                              Colors.black,
                                                                        ))
                                                                  ]),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ])));
                                    });
                              },
                              icon: const Icon(
                                Icons.filter_list_outlined,
                                size: 25,
                                color: Colors.black,
                              )),
                        )
                      ],
                    ),
                    MessageItems(
                      listItem: AppCubit.get(context).messageList,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
