import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import '../../../../model/cubit/app_cubit.dart';
import '../../../../model/cubit/app_states.dart';
import '../../../../model/widgets.dart';
import '../../../../view_model/builder_items/pages_builder_items.dart';

class JobDetail extends StatefulWidget {
  final String? position;
  final String? companyName;
  final String? picture;

  const JobDetail({super.key, this.position, this.companyName, this.picture});

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  bool description = false;
  bool company = false;
  bool people = false;
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
              title: headline(text: "Job Detail"),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.bookmark,
                    size: 30,
                    color: AppTheme.buttonColor,
                  ),
                )
              ],
            ),
            body: Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 78, right: 78),
                          child: SizedBox(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(15)),
                                  child: Image.network(
                                    alignment: Alignment.center,
                                    widget.picture!,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                headline2(text: widget.position!),
                                normalText(
                                    text:
                                        "${widget.companyName!}. Jakarta,Indonesia"),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: AppTheme.clickedBoxColor,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  30)),
                                      child: const Center(
                                          child: Text(
                                        "Fulltime",
                                        style: TextStyle(
                                            color: AppTheme.buttonColor),
                                      )),
                                    ),
                                    Container(
                                      height: 25,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: AppTheme.clickedBoxColor,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  30)),
                                      child: const Center(
                                          child: Text(
                                        "Onsite",
                                        style: TextStyle(
                                            color: AppTheme.buttonColor),
                                      )),
                                    ),
                                    Container(
                                      height: 25,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: AppTheme.clickedBoxColor,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  30)),
                                      child: const Center(
                                          child: Text(
                                        "Senior",
                                        style: TextStyle(
                                            color: AppTheme.buttonColor),
                                      )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: Container(
                            height: 50,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: AppTheme.boxColor,
                                borderRadius:
                                    BorderRadiusDirectional.circular(30)),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      description = true;
                                      company = false;
                                      people = false;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 125,
                                    decoration: BoxDecoration(
                                        color: description == true
                                            ? AppTheme.selectedSmallContainer
                                            : AppTheme.boxColor,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                30)),
                                    child: Center(
                                        child: Text(
                                      "Description",
                                      style: TextStyle(
                                          color: description == true
                                              ? AppTheme.primaryColor
                                              : AppTheme.sentence),
                                    )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      company = true;
                                      description = false;
                                      people = false;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        color: company == true
                                            ? AppTheme.selectedSmallContainer
                                            : AppTheme.boxColor,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                30)),
                                    child: Center(
                                        child: Text(
                                      "Company",
                                      style: TextStyle(
                                          color: company == true
                                              ? AppTheme.primaryColor
                                              : AppTheme.sentence),
                                    )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      people = true;
                                      description = false;
                                      company = false;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 125,
                                    decoration: BoxDecoration(
                                        color: people == true
                                            ? AppTheme.selectedSmallContainer
                                            : AppTheme.boxColor,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                30)),
                                    child: Center(
                                        child: Text(
                                      "People",
                                      style: TextStyle(
                                          color: people == true
                                              ? AppTheme.primaryColor
                                              : AppTheme.sentence),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            height: 500,
                            color: Colors.grey,
                            child: JobDetailSelections(
                              company: company,
                              description: description,
                              people: people,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: defaultButton(
                        text: "Apply now",
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRouter.applyJobStepper);
                        }),
                  )
                ],
              ),
            ),
          );
        });
  }
}
