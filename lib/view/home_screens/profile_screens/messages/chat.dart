import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';

import '../../../../model/colors_themes/color_palette.dart';
import '../../../../model/widgets.dart';
import '../../../../view_model/routes/route_name.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 200,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.homeScreen);
              },
            ),
            Image.asset(
              "assets/images/twitter.png",
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(width: 10),
            headline2(text: "Twitter"),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.7),
                      showDragHandle: true,
                      enableDrag: true,
                      elevation: 2,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: Container(
                              height: 600,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(15)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 30, left: 30),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  color: AppTheme.borderColor,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  left: 30,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.cases_outlined,
                                                      color: Colors.black,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Text(
                                                      "Visit job post",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(width: 130),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          size: 15,
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: Colors.black,
                                                        ))
                                                  ]),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            height: 50,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  color: AppTheme.borderColor,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  left: 30,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.note,
                                                      color: Colors.black,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Text(
                                                      "View my application ",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(width: 80),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          size: 15,
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: Colors.black,
                                                        ))
                                                  ]),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            height: 50,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  color: AppTheme.borderColor,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  left: 30,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.email_outlined,
                                                      color: Colors.black,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Text(
                                                      "Mark as unread",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(width: 110),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          size: 15,
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: Colors.black,
                                                        ))
                                                  ]),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            height: 50,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  color: AppTheme.borderColor,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  left: 30,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.notifications_none,
                                                      color: Colors.black,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Text(
                                                      "Mute",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(width: 175),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          size: 15,
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: Colors.black,
                                                        ))
                                                  ]),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            height: 50,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  color: AppTheme.borderColor,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  left: 30,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.archive,
                                                      color: Colors.black,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Text(
                                                      "Archive",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(width: 160),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          size: 15,
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: Colors.black,
                                                        ))
                                                  ]),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            height: 50,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  color: AppTheme.borderColor,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  left: 30,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.delete_outline,
                                                      color: Colors.black,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Text(
                                                      "Delete conversation",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(width: 85),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          size: 15,
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: Colors.black,
                                                        ))
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ])),
                        );
                      });
                },
                icon: const Icon(
                  Icons.format_list_bulleted_sharp,
                  size: 30,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey.withOpacity(0.3),
                      height: 2,
                      width: 120,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    normalText(text: "Today,Nov13"),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.3),
                      height: 2,
                      width: 120,
                    ),
                  ],
                ),
              ),
              const BubbleSpecialThree(
                delivered: true,
                seen: true,
                text:
                    "Hi Menna!, i'm Melan the selection team from twitter,Thank you for applying for a job in our company.We have announced that you are eligible for the interview stage.",
                color: Color(0xffE5E7EB),
                tail: false,
                isSender: false,
              ),
              const SizedBox(height: 10),
              const BubbleSpecialThree(
                delivered: true,
                seen: true,
                text:
                    "Hello Melan! Thank you for considering me this is good news for me.",
                color: Color(0xff3366FF),
                tail: false,
                isSender: true,
                textStyle: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              const BubbleSpecialThree(
                delivered: true,
                seen: true,
                text:
                    "Can we have an interview via google meet call today at 3pm? ",
                color: Color(0xffE5E7EB),
                tail: false,
                isSender: false,
              ),
              const SizedBox(height: 10),
              const BubbleSpecialThree(
                delivered: true,
                seen: true,
                text: "Of-course i can",
                color: Color(0xff3366FF),
                tail: false,
                isSender: true,
                textStyle: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              const BubbleSpecialThree(
                delivered: true,
                seen: true,
                text:
                    "Ok! the google meet link for later this afternoon.I ask for the timeliness,Thank you! https://meet.google.com/dis-sxdu-ave",
                color: Color(0xffE5E7EB),
                tail: false,
                isSender: false,
              ),
              MessageBar(
                actions: [
                  InkWell(
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: InkWell(
                      child: const Icon(
                        Icons.camera_alt,
                        color: Color(0xff3366FF),
                        size: 24,
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
