import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import '../model/cubit/app_cubit.dart';
import '../model/cubit/app_states.dart';
import '../model/widgets.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool hide = true;
  bool hide2 = true;
  togglePassword1() {
    return IconButton(
        onPressed: () {
          setState(() {
            hide = !hide;
          });
        },
        icon: hide == true
            ? const Icon(Icons.visibility_off_outlined)
            : const Icon(Icons.visibility_outlined));
  }

  togglePassword2() {
    return IconButton(
        onPressed: () {
          setState(() {
            hide2 = !hide2;
          });
        },
        icon: hide2 == true
            ? const Icon(Icons.visibility_off_outlined)
            : const Icon(Icons.visibility_outlined));
  }

  GlobalKey<FormState> newPassForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
                    key: newPassForm,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          headline(text: "Create new password"),
                          const SizedBox(
                            height: 5,
                          ),
                          normalText(
                              text:
                                  "Set your new password so you can login and access jobsque"),
                          const SizedBox(
                            height: 30,
                          ),
                          textField(
                              obscureText: hide,
                              controller: AppCubit.get(context).password,
                              hintText: "Old Password",
                              prefix: const Icon(Icons.lock_outline),
                              suffix: togglePassword1(),
                              validator: (oldPassword) =>
                                  oldPassword!.length < 8
                                      ? "Password must be at least 8 characters"
                                      : null),
                          const SizedBox(
                            height: 20,
                          ),
                          textField(
                              obscureText: hide2,
                              controller: AppCubit.get(context).password2,
                              hintText: "New Password",
                              prefix: const Icon(Icons.lock_outline),
                              suffix: togglePassword2(),
                              validator: (newPassword) =>
                                  newPassword!.length < 8
                                      ? "Password must be at least 8 characters"
                                      : null),
                          const SizedBox(
                            height: 230,
                          ),
                          defaultButton(
                              text: "Reset password",
                              onPressed: () {
                                if (newPassForm.currentState!.validate()) {
                                  Navigator.pushNamed(
                                      context, AppRouter.passwordChangeSuccess);
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
