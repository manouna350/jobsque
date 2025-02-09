import 'package:flutter/material.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import '../../model/colors_themes/color_palette.dart';
import '../../model/cubit/json_models/all_jobs.dart';
import '../../model/widgets.dart';
import '../../view/home_screens/profile_screens/apply_job/applied_job.dart';
import '../../view/home_screens/profile_screens/apply_job/job_detail.dart';
import '../routes/route_name.dart';

class SavedBuilderItem extends StatefulWidget {
  final Data jobItem;
  const SavedBuilderItem({super.key, required this.jobItem});

  @override
  State<SavedBuilderItem> createState() => _SavedBuilderItemState();
}

class _SavedBuilderItemState extends State<SavedBuilderItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
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
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                                                  onPressed: () {
                                                    setState(() {
                                                      AppCubit.get(context)
                                                          .deleteJobItem(widget
                                                              .jobItem.id);
                                                    });
                                                  },
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
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 50,
                  width: 50,
                  child: Image.network(
                    alignment: Alignment.center,
                    "${widget.jobItem.image}",
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
                            headline2(text: "${widget.jobItem.name}"),
                            normalText(text: "${widget.jobItem.compName}"),
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
                normalText(text: "${widget.jobItem.createdAt}"),
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
      ),
    );
  }
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 50,
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => JobDetail(
                                    companyName: "${jobItem.compName}",
                                    position: "${jobItem.name}",
                                    picture: "${jobItem.image}",
                                  )));
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
                    child: Center(
                        child: Text(
                      "${jobItem.jobTimeType}",
                      style: const TextStyle(color: AppTheme.buttonColor),
                    )),
                  ),
                ],
              ),
              const SizedBox(
                width: 150,
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
      ),
    );
  }
}

class ActiveAppliedBuilderItem extends StatelessWidget {
  final Data jobItem;
  const ActiveAppliedBuilderItem({super.key, required this.jobItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 50,
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
                      const SizedBox(width: 50),
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
          const SizedBox(
            height: 10,
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
                    child: Center(
                        child: Text(
                      "${jobItem.jobTimeType}",
                      style: const TextStyle(color: AppTheme.buttonColor),
                    )),
                  ),
                ],
              ),
              const SizedBox(
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "${jobItem.createdAt}",
                      style: const TextStyle(fontSize: 10, color: Colors.green),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AppliedJob(
                        companyName: "${jobItem.compName}",
                        position: "${jobItem.name}",
                        picture: "${jobItem.image}",
                      )));
            },
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppTheme.borderColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          backgroundColor: AppTheme.buttonColor,
                          child: Icon(Icons.done),
                        ),
                        normalText(text: "Biodata")
                      ],
                    ),
                  ),
                  const Text(
                    "-------",
                    style: TextStyle(color: AppTheme.buttonColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          backgroundColor: AppTheme.buttonColor,
                          child: Icon(Icons.done),
                        ),
                        normalText(text: "Type of work")
                      ],
                    ),
                  ),
                  const Text(
                    "-------",
                    style: TextStyle(color: AppTheme.buttonColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          backgroundColor: AppTheme.buttonColor,
                          child: Icon(Icons.done),
                        ),
                        normalText(text: "Upload portifolio")
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
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

// class MessageItems extends StatelessWidget {
//   final List<Data> listItem;
//   const MessageItems({
//     super.key,
//     required this.listItem,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return listItem.isEmpty
//         ? Padding(
//             padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset("assets/images/nomessages.png"),
//                 headline(text: "You have not received any messages"),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
//                   child: Center(
//                     child: normalText(
//                       text:
//                           "Once your application has reached the interview stage,you will get a message from the recruiter",
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         : ListView.separated(
//             separatorBuilder: (context, index) => const SizedBox(
//                   height: 3,
//                 ),
//             itemCount: listItem.length,
//             itemBuilder: (context, index) => BuilderItem(
//                   jobItem: listItem[index],
//                 ));
//   }
// }
