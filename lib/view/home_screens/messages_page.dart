import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import '../../model/colors_themes/color_palette.dart';
import '../../model/cubit/app_cubit.dart';
import '../../model/cubit/app_states.dart';
import '../../model/widgets.dart';

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
                    // MessageItems(
                    //   listItem: AppCubit.get(context).messageList,
                    // ),
                    title(text: "1 message"),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.chat);
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 15, right: 15),
                        child: Row(
                          children: [
                            Stack(children: [
                              CircleAvatar(
                                radius: 25,
                                child: SizedBox(
                                  height: 80,
                                  width: 70,
                                  child: Image.asset(
                                    "assets/images/twitter.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green,
                                child: Center(
                                    child: Text(
                                  "1",
                                  style: TextStyle(fontSize: 15),
                                )),
                              )
                            ]),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    headline2(text: "Twitter"),
                                    const Text(
                                        softWrap: true,
                                        "Ok! the google meet link for later this afternoon."
                                        "I ask for the timeliness,Thank you! "
                                        "https://meet.google.com/dis-sxdu-ave",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        overflow: TextOverflow.ellipsis),
                                  ]),
                            ),
                            const Text(
                              "12:30",
                              style: TextStyle(
                                  color: AppTheme.buttonColor, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
