import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import '../../model/cubit/app_cubit.dart';
import '../../model/cubit/app_states.dart';
import '../../model/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      return Scaffold(
        body: Stack(children: [
          Positioned(
            height: 250,
            width: 600,
            child: Container(
              decoration: const BoxDecoration(color: Color(0xffD6E4FF)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: headline(text: "Profile"),
                  ),
                  const SizedBox(width: 50),
                  IconButton(
                    icon: const Icon(Icons.logout),
                    color: Colors.orange,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.login);
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 200,
              left: 155,
              child: Image.asset(
                "assets/images/Profile.png",
              )),
          Positioned(
            top: 300,
            left: 15,
            right: 15,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  headline(text: AppCubit.get(context).name.text),
                  normalText(text: 'Senior UI/UX Designer'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: 500,
                    color: AppTheme.boxColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              normalText(text: "Applied"),
                              headline2(text: "46")
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey.withOpacity(0.3),
                          height: 60,
                          width: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              normalText(text: "Reviewed"),
                              headline2(text: "23")
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey.withOpacity(0.3),
                          height: 60,
                          width: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              normalText(text: "Contacted"),
                              headline2(text: "16")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      normalText(text: "About"),
                      const SizedBox(
                        width: 270,
                      ),
                      textButton(
                          text: "Edit",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRouter.completeProfile);
                          })
                    ],
                  ),
                  normalText(
                      text: 'It is a long established fact that a reader'
                          ' will be distracted by the readable content of a page whe'
                          'n looking at its layout.'),
                  const SizedBox(height: 20),
                  title(text: "General"),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.editProfile);
                    },
                    child: SizedBox(
                      height: 68,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppTheme.clickedBoxColor,
                            radius: 20,
                            child: Icon(
                              Icons.person_outlined,
                              color: AppTheme.buttonColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          headline3(text: "Edit Profile"),
                          const SizedBox(width: 215),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.portfolio);
                    },
                    child: SizedBox(
                      height: 68,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppTheme.clickedBoxColor,
                            radius: 20,
                            child: Icon(
                              Icons.folder_copy_outlined,
                              color: AppTheme.buttonColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          headline3(text: "Portfolio"),
                          const SizedBox(width: 235),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.language);
                    },
                    child: SizedBox(
                      height: 68,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppTheme.clickedBoxColor,
                            radius: 20,
                            child: Icon(
                              Icons.language,
                              color: AppTheme.buttonColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          headline3(text: "Language"),
                          const SizedBox(width: 225),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.notifications);
                    },
                    child: SizedBox(
                      height: 68,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppTheme.clickedBoxColor,
                            radius: 20,
                            child: Icon(
                              Icons.notifications_none,
                              color: AppTheme.buttonColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          headline3(text: "Notification"),
                          const SizedBox(width: 210),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.loginAndSecurity);
                    },
                    child: SizedBox(
                      height: 68,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppTheme.clickedBoxColor,
                            radius: 20,
                            child: Icon(
                              Icons.lock_outline,
                              color: AppTheme.buttonColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          headline3(text: "Login and Security"),
                          const SizedBox(width: 155),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  const SizedBox(height: 20),
                  title(text: "Other"),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.accessibility);
                    },
                    child: SizedBox(
                      height: 68,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          headline3(text: "Accessibility"),
                          const SizedBox(width: 240),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.helpCenter);
                    },
                    child: SizedBox(
                      height: 68,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          headline3(text: "Help center"),
                          const SizedBox(width: 250),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRouter.termsAndConditions);
                    },
                    child: SizedBox(
                      height: 68,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          headline3(text: "Terms and conditions"),
                          const SizedBox(width: 165),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.privacyPolicy);
                    },
                    child: SizedBox(
                      height: 68,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          headline3(text: "Privacy policy"),
                          const SizedBox(width: 230),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
    });
  }
}
