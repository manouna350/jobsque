import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/cubit/app_cubit.dart';
import '../model/cubit/app_states.dart';
import '../model/widgets.dart';
import '../view_model/routes/route_name.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> resetForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                // title: IconButton(
                //   icon: const Icon(Icons.arrow_back),
                //   onPressed: () {
                //     Navigator.of(context, rootNavigator: true).pop(context);
                //   },
                // ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Image.asset(
                      "assets/images/Logo.jpg",
                      height: 20,
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: resetForm,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          headline(text: "Reset Password"),
                          const SizedBox(
                            height: 5,
                          ),
                          normalText(
                              text:
                                  "Enter the email address you used when you joined and we will send you instructions to reset your password"),
                          const SizedBox(
                            height: 30,
                          ),
                          textField(
                              obscureText: false,
                              controller: AppCubit.get(context).email,
                              hintText: "Email",
                              prefix: const Icon(Icons.email_outlined),
                              validator: (email) => email!.length < 3
                                  ? "Please enter a valid email"
                                  : null),
                          const SizedBox(
                            height: 250,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              normalText(text: "You remember your password?"),
                              textButton(
                                  text: "Login",
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AppRouter.login);
                                  })
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          defaultButton(
                              text: "Request Password reset",
                              onPressed: () {
                                if (resetForm.currentState!.validate()) {
                                  Navigator.pushNamed(
                                      context, AppRouter.checkEmail);
                                } else {
                                  null;
                                }
                              }),
                        ]),
                  ),
                ),
              ));
        });
  }
}
