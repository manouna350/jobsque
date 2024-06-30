import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';

import '../../../../model/widgets.dart';
import '../../../../view_model/routes/route_name.dart';

class EmailAddressChange extends StatelessWidget {
  EmailAddressChange({super.key});

  final GlobalKey<FormState> editEmailForm = GlobalKey();

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
              title: headline(text: "Email Address"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Form(
                    key: editEmailForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        headline3(text: "Main email address"),
                        const SizedBox(
                          height: 15,
                        ),
                        textField(
                            validator: (email) {
                              if (email!.isEmpty || email.length < 3) {
                                return "Please enter a valid email";
                              } else {
                                return null;
                              }
                            },
                            prefix: const Icon(Icons.email_outlined),
                            controller: AppCubit.get(context).email,
                            hintText: "Email",
                            obscureText: false),
                        const SizedBox(height: 400),
                        defaultButton(
                            text: "Save",
                            onPressed: () {
                              if (editEmailForm.currentState!.validate()) {
                                Navigator.pushNamed(
                                    context, AppRouter.loginAndSecurity);
                              } else {
                                null;
                              }
                            })
                      ],
                    )),
              ),
            ),
          );
        });
  }
}
