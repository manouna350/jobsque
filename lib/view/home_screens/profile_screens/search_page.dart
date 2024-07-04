import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import 'package:jobsque/model/cubit/json_models/allJobs.dart';
import 'package:jobsque/model/widgets.dart';
import 'package:jobsque/view_model/routes/route_name.dart';

import '../../../view_model/builder_items/pages_builder_items.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchController searchController = SearchController();
  late Data jobItem;
  bool fullTime = false;
  bool remote = false;
  bool partTime = false;
  bool onsite = false;
  bool contract = false;
  bool internship = false;
  GlobalKey<FormState> searchForm = GlobalKey();
  String? chooseType;
  List salary = ["2k-4k", "5k-10k", "10k-more"];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouter.homeScreen);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: Colors.black,
                          )),
                      Form(
                        key: searchForm,
                        child: SizedBox(
                            width: 340,
                            child: SearchAnchor(
                              searchController: searchController,
                              isFullScreen: false,
                              dividerColor: Colors.grey,
                              builder: (context, SearchController controller) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SearchBar(
                                    onSubmitted: (sub) {},
                                    elevation: const WidgetStatePropertyAll(0),
                                    hintText: "Type something...",
                                    hintStyle: const WidgetStatePropertyAll(
                                        TextStyle(fontSize: 15)),
                                    leading: const Icon(Icons.search),
                                    trailing: <Widget>[
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              searchController.closeView("");
                                            });
                                          },
                                          icon: const Icon(Icons.close))
                                    ],
                                    controller: searchController,
                                    onTap: () {
                                      searchController.openView();
                                    },
                                    onChanged: (search) {
                                      searchController.openView();
                                      searchController =
                                          search as SearchController;
                                    },
                                  ),
                                );
                              },
                              suggestionsBuilder: (BuildContext context,
                                  SearchController controller) {
                                return List<ListTile>.generate(5, (int index) {
                                  final String item = "${jobItem.name}";
                                  return ListTile(
                                    title: Text(item),
                                    onTap: () {
                                      setState(() {
                                        searchController.closeView(item);
                                      });
                                    },
                                  );
                                });
                              },
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  useRootNavigator: true,
                                  isScrollControlled: true,
                                  isDismissible: true,
                                  barrierColor: Colors.black.withOpacity(0.7),
                                  showDragHandle: true,
                                  enableDrag: true,
                                  elevation: 2,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: SizedBox(
                                          width: double.maxFinite,
                                          child: Padding(
                                            padding: const EdgeInsets.all(25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              AppRouter.search);
                                                        },
                                                        icon: const Icon(
                                                          Icons.arrow_back,
                                                          color: Colors.black,
                                                        )),
                                                    const SizedBox(
                                                      width: 80,
                                                    ),
                                                    headline2(
                                                        text: "Set Filter"),
                                                    const SizedBox(
                                                      width: 80,
                                                    ),
                                                    textButton(
                                                        text: "Reset",
                                                        onPressed: () {
                                                          setState(() {
                                                            AppCubit.get(
                                                                    context)
                                                                .address
                                                                .clear();
                                                            AppCubit.get(
                                                                    context)
                                                                .title
                                                                .clear();
                                                          });
                                                        })
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                headline3(text: "job title"),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                textField(
                                                    onChanged: (String title) {
                                                      AppCubit.get(context)
                                                          .title
                                                          .text = title;
                                                    },
                                                    controller:
                                                        AppCubit.get(context)
                                                            .title,
                                                    hintText: "Job Title",
                                                    prefix: const Icon(
                                                        Icons.cases_outlined),
                                                    obscureText: false),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                headline3(text: "Location"),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                textField(
                                                    onChanged:
                                                        (String location) {
                                                      AppCubit.get(context)
                                                          .address
                                                          .text = location;
                                                    },
                                                    controller:
                                                        AppCubit.get(context)
                                                            .address,
                                                    hintText: "Location",
                                                    prefix: const Icon(
                                                        Icons.pin_drop),
                                                    obscureText: false),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                headline3(text: "Salary"),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: AppTheme
                                                              .borderColor)),
                                                  child: DropdownButton(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    icon: const Icon(Icons
                                                        .keyboard_arrow_down),
                                                    iconSize: 36,
                                                    isExpanded: true,
                                                    underline: const SizedBox(),
                                                    hint: const Text("Salary"),
                                                    value: chooseType,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        chooseType =
                                                            newValue as String?;
                                                      });
                                                    },
                                                    items:
                                                        salary.map((valueItem) {
                                                      return DropdownMenuItem(
                                                          value: valueItem,
                                                          child:
                                                              Text(valueItem));
                                                    }).toList(),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                headline3(text: "Job type"),
                                                const SizedBox(height: 10),
                                                Row(children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        fullTime = true;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadiusDirectional
                                                                  .circular(30),
                                                          border: Border.all(
                                                              color: fullTime
                                                                  ? AppTheme
                                                                      .borderColor
                                                                  : AppTheme
                                                                      .buttonColor),
                                                          color: fullTime
                                                              ? AppTheme
                                                                  .primaryColor
                                                              : AppTheme
                                                                  .clickedBoxColor),
                                                      child: Center(
                                                        child: Text(
                                                          "Full time",
                                                          style: TextStyle(
                                                              color: fullTime
                                                                  ? AppTheme
                                                                      .sentence
                                                                  : AppTheme
                                                                      .buttonColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        remote = true;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadiusDirectional
                                                                  .circular(30),
                                                          border: Border.all(
                                                              color: remote
                                                                  ? AppTheme
                                                                      .borderColor
                                                                  : AppTheme
                                                                      .buttonColor),
                                                          color: remote
                                                              ? AppTheme
                                                                  .primaryColor
                                                              : AppTheme
                                                                  .clickedBoxColor),
                                                      child: Center(
                                                        child: Text(
                                                          "Remote",
                                                          style: TextStyle(
                                                              color: remote
                                                                  ? AppTheme
                                                                      .sentence
                                                                  : AppTheme
                                                                      .buttonColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        contract = true;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadiusDirectional
                                                                  .circular(30),
                                                          border: Border.all(
                                                              color: contract
                                                                  ? AppTheme
                                                                      .borderColor
                                                                  : AppTheme
                                                                      .buttonColor),
                                                          color: contract
                                                              ? AppTheme
                                                                  .primaryColor
                                                              : AppTheme
                                                                  .clickedBoxColor),
                                                      child: Center(
                                                        child: Text(
                                                          "Contract",
                                                          style: TextStyle(
                                                              color: contract
                                                                  ? AppTheme
                                                                      .sentence
                                                                  : AppTheme
                                                                      .buttonColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                                const SizedBox(height: 20),
                                                Row(children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        partTime = true;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadiusDirectional
                                                                  .circular(30),
                                                          border: Border.all(
                                                              color: partTime
                                                                  ? AppTheme
                                                                      .borderColor
                                                                  : AppTheme
                                                                      .buttonColor),
                                                          color: partTime
                                                              ? AppTheme
                                                                  .primaryColor
                                                              : AppTheme
                                                                  .clickedBoxColor),
                                                      child: Center(
                                                        child: Text(
                                                          "Part time",
                                                          style: TextStyle(
                                                              color: partTime
                                                                  ? AppTheme
                                                                      .sentence
                                                                  : AppTheme
                                                                      .buttonColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        onsite = true;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadiusDirectional
                                                                  .circular(30),
                                                          border: Border.all(
                                                              color: onsite
                                                                  ? AppTheme
                                                                      .borderColor
                                                                  : AppTheme
                                                                      .buttonColor),
                                                          color: onsite
                                                              ? AppTheme
                                                                  .primaryColor
                                                              : AppTheme
                                                                  .clickedBoxColor),
                                                      child: Center(
                                                        child: Text(
                                                          "Onsite",
                                                          style: TextStyle(
                                                              color: onsite
                                                                  ? AppTheme
                                                                      .sentence
                                                                  : AppTheme
                                                                      .buttonColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        internship = true;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadiusDirectional
                                                                  .circular(30),
                                                          border: Border.all(
                                                              color: internship
                                                                  ? AppTheme
                                                                      .borderColor
                                                                  : AppTheme
                                                                      .buttonColor),
                                                          color: internship
                                                              ? AppTheme
                                                                  .primaryColor
                                                              : AppTheme
                                                                  .clickedBoxColor),
                                                      child: Center(
                                                        child: Text(
                                                          "Internship",
                                                          style: TextStyle(
                                                              color: internship
                                                                  ? AppTheme
                                                                      .sentence
                                                                  : AppTheme
                                                                      .buttonColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                                const SizedBox(height: 20),
                                                defaultButton(
                                                    text: "Show result",
                                                    onPressed: () {})
                                              ],
                                            ),
                                          )),
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.filter_list_outlined,
                              size: 25,
                              color: Colors.black,
                            )),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  remote = true;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 110,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(30),
                                    border: Border.all(
                                        color: remote
                                            ? AppTheme.borderColor
                                            : Colors.transparent),
                                    color: remote
                                        ? AppTheme.primaryColor
                                        : AppTheme.selectedSmallContainer),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Remote",
                                        style: TextStyle(
                                            color: remote
                                                ? AppTheme.sentence
                                                : AppTheme.primaryColor),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              remote = false;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 15,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  fullTime = true;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 110,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(30),
                                    border: Border.all(
                                        color: fullTime
                                            ? AppTheme.borderColor
                                            : Colors.transparent),
                                    color: fullTime
                                        ? AppTheme.primaryColor
                                        : AppTheme.selectedSmallContainer),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Full time",
                                        style: TextStyle(
                                            color: fullTime
                                                ? AppTheme.sentence
                                                : AppTheme.primaryColor),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              fullTime = false;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 15,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  contract = true;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(30),
                                    border: Border.all(
                                        color: contract
                                            ? AppTheme.borderColor
                                            : Colors.transparent),
                                    color: contract
                                        ? AppTheme.primaryColor
                                        : AppTheme.selectedSmallContainer),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Contract",
                                        style: TextStyle(
                                            color: contract
                                                ? AppTheme.sentence
                                                : AppTheme.primaryColor),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              contract = false;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 15,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  internship = true;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(30),
                                    border: Border.all(
                                        color: internship
                                            ? AppTheme.borderColor
                                            : Colors.transparent),
                                    color: internship
                                        ? AppTheme.primaryColor
                                        : AppTheme.selectedSmallContainer),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Internship",
                                        style: TextStyle(
                                            color: internship
                                                ? AppTheme.sentence
                                                : AppTheme.primaryColor),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              internship = false;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 15,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  partTime = true;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(30),
                                    border: Border.all(
                                        color: partTime
                                            ? AppTheme.borderColor
                                            : Colors.transparent),
                                    color: partTime
                                        ? AppTheme.primaryColor
                                        : AppTheme.selectedSmallContainer),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Part Time",
                                        style: TextStyle(
                                            color: partTime
                                                ? AppTheme.sentence
                                                : AppTheme.primaryColor),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              partTime = false;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 15,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  onsite = true;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(30),
                                    border: Border.all(
                                        color: onsite
                                            ? AppTheme.borderColor
                                            : Colors.transparent),
                                    color: onsite
                                        ? AppTheme.primaryColor
                                        : AppTheme.selectedSmallContainer),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "On site",
                                        style: TextStyle(
                                            color: onsite
                                                ? AppTheme.sentence
                                                : AppTheme.primaryColor),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              onsite = false;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 15,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                title(text: "Featuring 120+ jobs"),
                SearchPageItems(
                  listItem: AppCubit.get(context).jobList,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
