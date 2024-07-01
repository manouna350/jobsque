import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../model/cubit/app_cubit.dart';
import '../../../model/cubit/app_states.dart';
import '../../../model/widgets.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});
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
                  Navigator.pushNamed(context, AppRouter.homeScreen);
                },
              ),
              centerTitle: true,
              title: headline(text: "Complete profile"),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 50, right: 50, bottom: 10),
                        child: CircularPercentIndicator(
                          radius: 50,
                          backgroundColor: AppTheme.borderColor,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: AppTheme.buttonColor,
                          lineWidth: 8,
                          animation: true,
                          percent: 0.5,
                          center: const Text(
                            "50%",
                            style: TextStyle(
                                color: AppTheme.buttonColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Text(
                        "2/4 Completed",
                        style: TextStyle(
                            color: AppTheme.buttonColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      normalText(
                          text:
                              "Complete your profile before applying for a job"),
                      const SizedBox(height: 20),
                      Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppTheme.borderColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const CircleAvatar(
                                radius: 13,
                                backgroundColor: AppTheme.borderColor,
                                child: Icon(
                                  Icons.done,
                                  size: 15,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  headline2(text: "Personal Details"),
                                  const Text(
                                    "Full name,email,phone number,and \nyour address",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AppRouter.personalDetails);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: AppTheme.borderColor,
                      ),
                      Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppTheme.borderColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const CircleAvatar(
                                radius: 13,
                                backgroundColor: AppTheme.borderColor,
                                child: Icon(
                                  Icons.done,
                                  size: 15,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  headline2(text: "Education"),
                                  const Text(
                                    "Enter your educational history to be \nconsidered by the recruiter",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AppRouter.education);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: AppTheme.borderColor,
                      ),
                      Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppTheme.borderColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const CircleAvatar(
                                radius: 13,
                                backgroundColor: AppTheme.borderColor,
                                child: Icon(
                                  Icons.done,
                                  size: 15,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  headline2(text: "Experience"),
                                  const Text(
                                    "Enter your work experience to be \nconsidered by the recruiter",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AppRouter.experience);
                                  },
                                  icon: const Icon(Icons.arrow_forward,
                                      color: Colors.black))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: AppTheme.borderColor,
                      ),
                      Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppTheme.borderColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const CircleAvatar(
                                radius: 13,
                                backgroundColor: AppTheme.borderColor,
                                child: Icon(
                                  Icons.done,
                                  size: 15,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  headline2(text: "Portfolio"),
                                  const Text(
                                    "Create your portfolio.Applying \nfor various types of jobs is easier",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        AppRouter.portfolioCompleteProfile);
                                  },
                                  icon: const Icon(Icons.arrow_forward,
                                      color: Colors.black))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
