import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';

import '../../../../model/widgets.dart';
import '../../../../view_model/routes/route_name.dart';

class PhoneNumberChange extends StatefulWidget {
  const PhoneNumberChange({super.key});

  @override
  State<PhoneNumberChange> createState() => _PhoneNumberChangeState();
}

class _PhoneNumberChangeState extends State<PhoneNumberChange> {
  final GlobalKey<FormState> editPhoneForm = GlobalKey();

  bool switchOn = false;

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
              title: headline(text: "Phone number"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Form(
                    key: editPhoneForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        headline3(text: "Main phone number"),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultPhoneField(
                          validator: (numb) {
                            if (numb!.isEmpty) {
                              return "Please enter a valid phone number";
                            } else {
                              return null;
                            }
                          },
                          controller: AppCubit.get(context).number,
                          hintText: "Phone number",
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            normalText(
                                text:
                                    "Use the phone number to reset\n your password"),
                            const SizedBox(width: 100),
                            CupertinoSwitch(
                                activeColor: AppTheme.buttonColor,
                                value: switchOn,
                                onChanged: (bool switchOff) {
                                  setState(() {
                                    switchOn = switchOff;
                                  });
                                })
                          ],
                        ),
                        const SizedBox(height: 330),
                        defaultButton(
                            text: "Save",
                            onPressed: () {
                              if (editPhoneForm.currentState!.validate()) {
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
