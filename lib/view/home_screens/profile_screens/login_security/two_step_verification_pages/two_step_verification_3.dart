import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import '../../../../../model/widgets.dart';
import '../../../../../view_model/routes/route_name.dart';

class TwoStepVerification3 extends StatefulWidget {
  const TwoStepVerification3({super.key});

  @override
  State<TwoStepVerification3> createState() => _TwoStepVerification3State();
}

class _TwoStepVerification3State extends State<TwoStepVerification3> {
  bool switchOn = false;
  bool hide = true;
  togglePassword() {
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

  GlobalKey<FormState> twoStepForm = GlobalKey();

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
                  Navigator.of(context, rootNavigator: true).pop(context);
                },
              ),
              centerTitle: true,
              title: headline(text: "Two-step verification"),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: twoStepForm,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headline2(text: "Add a phone number"),
                      normalText(
                          text:
                              "we will send a verification code to this number"),
                      const SizedBox(height: 10),
                      defaultPhoneField(
                        hintText: "Enter phone number",
                        validator: (numb) {
                          if (numb!.isEmpty) {
                            return "Please enter a valid phone number";
                          } else {
                            return null;
                          }
                        },
                        controller: AppCubit.get(context).number,
                      ),
                      const SizedBox(height: 20),
                      headline2(text: "Enter your password"),
                      const SizedBox(height: 10),
                      textField(
                          onChanged: (pass) {
                            AppCubit.get(context).password.text = pass;
                          },
                          controller: AppCubit.get(context).password,
                          hintText: "Password",
                          prefix: const Icon(Icons.lock_outline),
                          validator: (pass) {
                            if (pass!.isEmpty || pass.length < 3) {
                              return "Please enter a valid password";
                            } else {
                              return null;
                            }
                          },
                          suffix: togglePassword(),
                          obscureText: hide),
                      const SizedBox(height: 240),
                      defaultButton(
                          text: "Send code",
                          onPressed: () {
                            if (twoStepForm.currentState!.validate()) {
                              Navigator.pushNamed(
                                  context, AppRouter.twoStepVerification4);
                            } else {
                              null;
                            }
                          })
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
