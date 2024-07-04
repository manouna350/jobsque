import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../model/cubit/app_cubit.dart';
import '../../../model/cubit/app_states.dart';
import '../../../model/widgets.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
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
                          addAutomaticKeepAlive: true,
                          backgroundColor: AppTheme.borderColor,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: AppTheme.buttonColor,
                          lineWidth: 8,
                          animateFromLastPercent: true,
                          animation: true,
                          percent: AppCubit.get(context).percent,
                          center: Text(
                            state is PersonalDetailsSaveSuccess
                                ? "25%"
                                : state is EducationSaveSuccess
                                    ? "50%"
                                    : state is ExperienceSaveSuccess
                                        ? "75%"
                                        : state is PortfolioSaveSuccess
                                            ? "100%"
                                            : "0%",
                            style: const TextStyle(
                                color: AppTheme.buttonColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        state is PersonalDetailsSaveSuccess
                            ? "1/4 completed"
                            : state is EducationSaveSuccess
                                ? "2/4 completed"
                                : state is ExperienceSaveSuccess
                                    ? "3/4 completed"
                                    : state is PortfolioSaveSuccess
                                        ? "Completed!"
                                        : "0/4 completed",
                        style: const TextStyle(
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
                            color: state is PersonalDetailsSaveSuccess
                                ? AppTheme.clickedBoxColor
                                : AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: state is PersonalDetailsSaveSuccess
                                  ? AppTheme.buttonColor
                                  : AppTheme.borderColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 13,
                                backgroundColor:
                                    state is PersonalDetailsSaveSuccess
                                        ? AppTheme.buttonColor
                                        : AppTheme.borderColor,
                                child: const Icon(
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
                            color: state is EducationSaveSuccess
                                ? AppTheme.clickedBoxColor
                                : AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: state is EducationSaveSuccess
                                  ? AppTheme.buttonColor
                                  : AppTheme.borderColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: state is EducationSaveSuccess
                                    ? AppTheme.buttonColor
                                    : AppTheme.borderColor,
                                child: const Icon(
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
                            color: state is ExperienceSaveSuccess
                                ? AppTheme.clickedBoxColor
                                : AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: state is ExperienceSaveSuccess
                                  ? AppTheme.buttonColor
                                  : AppTheme.borderColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: state is ExperienceSaveSuccess
                                    ? AppTheme.buttonColor
                                    : AppTheme.borderColor,
                                child: const Icon(
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
                            color: state is PortfolioSaveSuccess
                                ? AppTheme.clickedBoxColor
                                : AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: state is PortfolioSaveSuccess
                                  ? AppTheme.buttonColor
                                  : AppTheme.borderColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: state is PortfolioSaveSuccess
                                    ? AppTheme.buttonColor
                                    : AppTheme.borderColor,
                                child: const Icon(
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
