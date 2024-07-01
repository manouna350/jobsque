import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';

import '../../../../model/shared/cache_helper.dart';
import '../../../../model/shared/enum.dart';
import '../../../../model/widgets.dart';
import '../../../../view_model/routes/route_name.dart';

class ChangePasswordSecurity extends StatefulWidget {
  const ChangePasswordSecurity({super.key});

  @override
  State<ChangePasswordSecurity> createState() => _ChangePasswordSecurityState();
}

class _ChangePasswordSecurityState extends State<ChangePasswordSecurity> {
  final GlobalKey<FormState> changePasswordSecurityForm = GlobalKey();

  bool hide = true;

  bool hide2 = true;
  bool hide3 = true;

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

  togglePassword3() {
    return IconButton(
        onPressed: () {
          setState(() {
            hide3 = !hide3;
          });
        },
        icon: hide3 == true
            ? const Icon(Icons.visibility_off_outlined)
            : const Icon(Icons.visibility_outlined));
  }

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
              title: headline(text: "Change password"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Form(
                    key: changePasswordSecurityForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        headline3(text: "Enter old password"),
                        textField(
                            onChanged: (pass) {
                              AppCubit.get(context).password.text = pass;
                            },
                            validator: (pass) {
                              if (pass!.isEmpty || pass.length < 3) {
                                return "Please enter a valid password";
                              } else {
                                return null;
                              }
                            },
                            suffix: togglePassword1(),
                            prefix: const Icon(Icons.lock_outlined),
                            controller: AppCubit.get(context).password,
                            hintText: "Old password",
                            obscureText: hide),
                        const SizedBox(height: 15),
                        headline3(text: "Enter new password"),
                        textField(
                            onChanged: (newPass) {
                              AppCubit.get(context).password2.text = newPass;
                            },
                            validator: (pass) {
                              if (pass!.isEmpty || pass.length < 3) {
                                return "Please enter a valid password";
                              } else {
                                return null;
                              }
                            },
                            suffix: togglePassword2(),
                            prefix: const Icon(Icons.lock_outlined),
                            controller: AppCubit.get(context).password2,
                            hintText: "new password",
                            obscureText: hide2),
                        const SizedBox(height: 15),
                        headline3(text: "confirm new password"),
                        textField(
                            onChanged: (pass3) {
                              AppCubit.get(context).password3.text = pass3;
                            },
                            validator: (pass1) {
                              if (pass1!.isEmpty || pass1.length < 3) {
                                return "Please enter a valid password";
                              } else if (pass1 !=
                                  AppCubit.get(context).password2.text) {
                                return "Password doesn't match";
                              } else {
                                return null;
                              }
                            },
                            suffix: togglePassword3(),
                            prefix: const Icon(Icons.lock_outlined),
                            controller: AppCubit.get(context).password3,
                            hintText: "Confirm new password",
                            obscureText: hide3),
                        const SizedBox(height: 15),
                        const SizedBox(height: 160),
                        defaultButton(
                            text: "Save",
                            onPressed: () {
                              if (changePasswordSecurityForm.currentState!
                                  .validate()) {
                                CacheHelper.putString(
                                  key: SharedKeys.password!,
                                  value: AppCubit.get(context).password.text,
                                );
                                Navigator.pushNamed(
                                    context, AppRouter.loginAndSecurity);
                              } else {
                                null;
                              }
                              AppCubit.get(context).password.clear();
                              AppCubit.get(context).password2.clear();
                              AppCubit.get(context).password3.clear();
                            })
                      ],
                    )),
              ),
            ),
          );
        });
  }
}
