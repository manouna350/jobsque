import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/widgets.dart';
import '../../model/cubit/app_states.dart';
import '../../model/cubit/json_models/allJobs.dart';
import '../../view_model/builder_items/job_list_items.dart';
import '../../view_model/routes/route_name.dart';

class HomePage extends StatelessWidget {
  final Data? jobItem;

  const HomePage({super.key, this.jobItem});

  homeList({required List list}) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              height: 10,
              color: Colors.grey.withOpacity(0.1),
            ),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) => HomeBuilderItem(
              jobItem: list[index],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, bottom: 10, right: 10, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  headline(
                                      text:
                                          "Hi,  ${AppCubit.get(context).name.text}"),
                                  const AnimatedEmoji(
                                    AnimatedEmojis.wave,
                                    size: 30,
                                  ),
                                ],
                              ),
                              normalText(
                                  text:
                                      "Create a better future for yourself here")
                            ],
                          ),
                          const SizedBox(
                            width: 45,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: AppTheme.borderColor)),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRouter.notification);
                                },
                                icon: const Icon(
                                  Icons.notifications_none,
                                  size: 25,
                                  color: Colors.black,
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRouter.search);
                          },
                          child: Container(
                            height: 50,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: AppTheme.borderColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  normalText(text: "Type something....")
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          headline2(text: "Suggested job"),
                          const SizedBox(
                            width: 170,
                          ),
                          textButton(
                              text: "view all",
                              onPressed: () {
                                Navigator.pushNamed(context, AppRouter.search);
                              })
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                            color: const Color(0xff091A7A),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            // child: Image.network("${jobItem?.image}"),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            // child:
                            // SuggestedJobs(
                            //     jobItem: AppCubit.get(context).jobList[0]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          headline2(text: "Recent job"),
                          const SizedBox(
                            width: 195,
                          ),
                          textButton(
                              text: "view all",
                              onPressed: () {
                                Navigator.pushNamed(context, AppRouter.search);
                              })
                        ],
                      ),
                      homeList(list: AppCubit.get(context).jobList)
                    ],
                  ),
                )
              ],
            ),
          ));
        });
  }
}
