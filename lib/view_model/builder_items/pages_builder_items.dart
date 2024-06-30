import 'package:flutter/material.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';
import 'package:jobsque/model/cubit/json_models/allJobs.dart';
import 'package:jobsque/model/widgets.dart';
import 'package:jobsque/view/home_screens/profile_screens/apply_job/job_detail.dart';
import '../../model/cubit/app_cubit.dart';
import '../routes/route_name.dart';

listItem({required List list}) {
  return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) => BuilderItem(
            jobItem: list[index],
          ));
}

class BuilderItem extends StatelessWidget {
  final Data jobItem;
  const BuilderItem({super.key, required this.jobItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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
                      borderRadius: BorderRadiusDirectional.circular(15)),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: AppTheme.borderColor,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(
                                              Icons.send_outlined,
                                              color: Colors.black,
                                            ),
                                            const Text(
                                              "ApplyJob",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context,
                                                      AppRouter
                                                          .applyJobStepper);
                                                },
                                                icon: const Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.black,
                                                ))
                                          ]),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 50,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: AppTheme.borderColor,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(
                                              Icons.share,
                                              color: Colors.black,
                                            ),
                                            const Text(
                                              "Share via",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.black,
                                                ))
                                          ]),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 50,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: AppTheme.borderColor,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(
                                              Icons.delete_outline,
                                              color: Colors.black,
                                            ),
                                            const Text(
                                              "Cancel save",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.black,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 40,
                width: 50,
                child: Image.network(
                  alignment: Alignment.center,
                  "${jobItem.image}",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headline2(text: "${jobItem.name}"),
                          normalText(text: "${jobItem.compName}"),
                        ],
                      ),
                      const SizedBox(width: 30),
                      const Icon(
                        Icons.linear_scale_outlined,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              normalText(text: "${jobItem.createdAt}"),
              const SizedBox(
                width: 50,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 15,
                    color: Colors.green,
                  ),
                  Text(
                    "Be an early applicant",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class HomeBuilderItem extends StatelessWidget {
  final Data jobItem;
  const HomeBuilderItem({super.key, required this.jobItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 40,
              width: 50,
              child: Image.network(
                alignment: Alignment.center,
                "${jobItem.image}",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.jobDetail);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headline2(text: "${jobItem.name}"),
                          normalText(text: "${jobItem.compName}"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    IconButton(
                      icon: const Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 25,
                  width: 80,
                  decoration: BoxDecoration(
                      color: AppTheme.clickedBoxColor,
                      borderRadius: BorderRadiusDirectional.circular(30)),
                  child: const Center(
                      child: Text(
                    "Fulltime",
                    style: TextStyle(color: AppTheme.buttonColor),
                  )),
                ),
                Container(
                  height: 25,
                  width: 80,
                  decoration: BoxDecoration(
                      color: AppTheme.clickedBoxColor,
                      borderRadius: BorderRadiusDirectional.circular(30)),
                  child: const Center(
                      child: Text(
                    "Onsite",
                    style: TextStyle(color: AppTheme.buttonColor),
                  )),
                ),
                Container(
                  height: 25,
                  width: 80,
                  decoration: BoxDecoration(
                      color: AppTheme.clickedBoxColor,
                      borderRadius: BorderRadiusDirectional.circular(30)),
                  child: const Center(
                      child: Text(
                    "Senior",
                    style: TextStyle(color: AppTheme.buttonColor),
                  )),
                )
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Icon(
                    Icons.attach_money,
                    size: 15,
                    color: Colors.green,
                  ),
                  Text(
                    "${jobItem.salary}/month",
                    style: const TextStyle(fontSize: 10, color: Colors.green),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class MessageItems extends StatelessWidget {
  final List<Data> listItem;
  const MessageItems({
    super.key,
    required this.listItem,
  });

  @override
  Widget build(BuildContext context) {
    return listItem.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/nomessages.png"),
                headline(text: "You have not received any messages"),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Center(
                    child: normalText(
                      text:
                          "Once your application has reached the interview stage,you will get a message from the recruiter",
                    ),
                  ),
                )
              ],
            ),
          )
        : ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
                  height: 3,
                ),
            itemCount: listItem.length,
            itemBuilder: (context, index) => BuilderItem(
                  jobItem: listItem[index],
                ));
  }
}

class SavedItems extends StatelessWidget {
  final List<Data> listItem;
  const SavedItems({
    super.key,
    required this.listItem,
  });

  @override
  Widget build(BuildContext context) {
    return listItem.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/Saved item.png"),
                headline(text: "Nothing has been saved yet"),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Center(
                    child: normalText(
                      text: "Press the star icon on the job you want to save",
                    ),
                  ),
                )
              ],
            ),
          )
        : Column(children: [
            title(text: "${listItem.length.toString()}Jobs saved"),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(
                        height: 10,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                  itemCount: listItem.length,
                  itemBuilder: (context, index) => BuilderItem(
                        jobItem: listItem[index],
                      )),
            ),
          ]);
  }
}

class AppliedItems extends StatefulWidget {
  final List<Data> listItem;

  const AppliedItems({
    super.key,
    required this.listItem,
    required this.active,
    required this.rejected,
  });

  @override
  State<AppliedItems> createState() => _AppliedItemsState();
  final bool active;
  final bool rejected;
}

class _AppliedItemsState extends State<AppliedItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.active == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(text: "${widget.listItem.length.toString()} Jobs"),
                  ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 3,
                          ),
                      itemCount: widget.listItem.length,
                      itemBuilder: (context, index) => BuilderItem(
                            jobItem: widget.listItem[index],
                          )),
                ],
              )
            : widget.rejected == true
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/images/noapplied.png"),
                        headline(text: "No applications were rejected"),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: Center(
                            child: normalText(
                              text:
                                  "If there is an application that was rejected by the company it will appear here",
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : null);
  }
}

class NotificationPageItems extends StatelessWidget {
  final List<Data> listItem;
  const NotificationPageItems({
    super.key,
    required this.listItem,
  });

  @override
  Widget build(BuildContext context) {
    return listItem.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/Notification Ilustration.png"),
                headline(text: "No new notifications yet"),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Center(
                    child: normalText(
                      text:
                          "You will receive a notification if there is something on your account",
                    ),
                  ),
                )
              ],
            ),
          )
        : ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
                  height: 3,
                ),
            itemCount: listItem.length,
            itemBuilder: (context, index) => BuilderItem(
                  jobItem: listItem[index],
                ));
  }
}

class SearchPageItems extends StatelessWidget {
  final List<Data> listItem;
  const SearchPageItems({
    super.key,
    required this.listItem,
  });

  @override
  Widget build(BuildContext context) {
    return listItem.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/Search Ilustration.png"),
                headline(text: "Search not found"),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Center(
                    child: normalText(
                      text:
                          "Try searching with different keywords\n so we can show you",
                    ),
                  ),
                )
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                      height: 10,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                itemCount: listItem.length,
                itemBuilder: (context, index) => BuilderItem(
                      jobItem: listItem[index],
                    )),
          );
  }
}

class CompletedApplyStepper extends StatelessWidget {
  const CompletedApplyStepper({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/ApplyComplete.png"),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 50),
            child: headline(text: "Your data has been successfully sent"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Center(
              child: normalText(
                text:
                    "You will get a message from our team,about\n the announcement of employee acceptance",
              ),
            ),
          ),
          const SizedBox(height: 200),
          defaultButton(
              text: "Back to home",
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.homeScreen);
              })
        ],
      ),
    ));
  }
}

class JobDetailSelections extends StatefulWidget {
  const JobDetailSelections({
    super.key,
    required this.description,
    required this.company,
    required this.people,
  });

  @override
  State<JobDetailSelections> createState() => _JobDetailSelectionsState();
  final bool description;
  final bool company;
  final bool people;
}

class _JobDetailSelectionsState extends State<JobDetailSelections> {
  List workType = ["UI/UX ", "fullStack"];
  String? chooseType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.description == true
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headline2(text: "Job description"),
                normalText(
                    text:
                        "Fusce posuere arcu eros, quis elementum orci blandit vel."
                        " Ut pulvinar gravida egestas. Etiam fermentum feugiat tincidunt. "
                        "Vestibulum ut leo sed massa consectetur consectetur. In hac habitasse platea dictumst. "
                        "Vivamus elit neque, scelerisque luctus elementum interdum, aliquam quis nibh. "
                        "Vestibulum aliquet, sem vitae faucibus maximus, neque felis scelerisque lectus,"
                        " a faucibus ex elit sed est."),
                const SizedBox(
                  height: 10,
                ),
                headline2(text: "Skill required"),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      normalText(
                          text:
                              ". Fusce posuere arcu eros, quis elementum orci blandit vel."),
                      normalText(
                          text:
                              ". Fusce posuere arcu eros, quis elementum orci blandit vel."),
                      normalText(
                          text:
                              ". Fusce posuere arcu eros, quis elementum orci blandit vel."),
                      normalText(
                          text:
                              ". Fusce posuere arcu eros, quis elementum orci blandit vel."),
                      normalText(
                          text:
                              ". Fusce posuere arcu eros, quis elementum orci blandit vel.")
                    ],
                  ),
                )
              ],
            )
          : widget.company == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headline2(text: "Contact Us"),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(15),
                                border:
                                    Border.all(color: AppTheme.borderColor)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  normalText(text: "Email"),
                                  headline3(text: "twitter@mail.com")
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 60,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(15),
                                border:
                                    Border.all(color: AppTheme.borderColor)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  normalText(text: "Website"),
                                  headline3(text: "https://twitter.com")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    headline2(text: "About company"),
                    normalText(
                        text:
                            "Fusce posuere arcu eros, quis elementum orci blandit vel."
                            " Ut pulvinar gravida egestas. Etiam fermentum feugiat tincidunt. "
                            "Vestibulum ut leo sed massa consectetur consectetur. In hac habitasse platea dictumst. "
                            "Vivamus elit neque, scelerisque luctus elementum interdum, aliquam quis nibh. "
                            "Vestibulum aliquet, sem vitae faucibus maximus, neque felis scelerisque lectus,"
                            " a faucibus ex elit sed est."
                            " Ut pulvinar gravida egestas. Etiam fermentum feugiat tincidunt. "
                            "Vestibulum ut leo sed massa consectetur consectetur. In hac habitasse platea dictumst. "
                            "Vivamus elit neque, scelerisque luctus elementum interdum, aliquam quis nibh. "
                            "Vestibulum aliquet, sem vitae faucibus maximus, neque felis scelerisque lectus,"
                            " a faucibus ex elit sed est.")
                  ],
                )
              : widget.people == true
                  ? Column(children: [
                      Row(
                        children: [
                          Column(children: [
                            headline2(text: "6 Employees for"),
                            normalText(text: "UI/UX Design"),
                          ]),
                          const SizedBox(width: 50),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(30),
                                border:
                                    Border.all(color: AppTheme.borderColor)),
                            child: DropdownButton(
                              padding: const EdgeInsets.all(10),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              iconSize: 20,
                              isExpanded: true,
                              underline: const SizedBox(),
                              hint: const Text(""),
                              value: chooseType,
                              onChanged: (newValue) {
                                setState(() {
                                  chooseType = newValue as String?;
                                });
                              },
                              items: workType.map((valueItem) {
                                return DropdownMenuItem(
                                    value: valueItem, child: Text(valueItem));
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          itemCount: 6,
                          itemBuilder: (context, index) => Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  headline2(text: "Daniel brag"),
                                  normalText(
                                      text: "Senior UI/UX Designer at twitter")
                                ],
                              ),
                              Column(
                                children: [
                                  normalText(text: "work for"),
                                  const Text(
                                    "5 years",
                                    style:
                                        TextStyle(color: AppTheme.buttonColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ])
                  : null,
    );
  }
}
