import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import '../../../model/widgets.dart';
import '../../../view_model/routes/route_name.dart';

class LoginAndSecurity extends StatelessWidget {
  const LoginAndSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.homeScreen);
                },
              ),
              centerTitle: true,
              title: headline(text: "Login and security"),
            ),
            body: Column(
              children: [
                title(text: "Account access"),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRouter.emailChange);
                        },
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              headline3(text: "Email address"),
                              const SizedBox(
                                width: 90,
                              ),
                              normalText(text: "xxxx@gmail.com"),
                              const SizedBox(width: 3),
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
                              context, AppRouter.phoneNumberChange);
                        },
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              headline3(text: "Phone number"),
                              const SizedBox(width: 205),
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
                              context, AppRouter.changePasswordSecurity);
                        },
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              headline3(text: "Change password"),
                              const SizedBox(width: 175),
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
                              context, AppRouter.twoStepVerification1);
                        },
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              headline3(text: "Two-step verification"),
                              const SizedBox(width: 150),
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
                        onTap: () {},
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              headline3(text: "Face ID"),
                              const SizedBox(width: 260),
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
                )
              ],
            ),
          );
        });
  }
}
