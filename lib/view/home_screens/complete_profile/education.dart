import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';

import '../../../model/cubit/app_cubit.dart';
import '../../../model/cubit/app_states.dart';
import '../../../model/shared/cache_helper.dart';
import '../../../model/shared/enum.dart';
import '../../../model/widgets.dart';
import '../../../view_model/routes/route_name.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  GlobalKey<FormState> eduForm = GlobalKey();
  bool isComplete = false;

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
              title: headline(text: "Education"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                        height: 515,
                        width: 500,
                        decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppTheme.borderColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: eduForm,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                normalText2(text: "University *"),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                        top: 10),
                                    child: textFieldEmpty(
                                      validator: (university) => university!
                                                  .length <
                                              3
                                          ? "Please enter your university name"
                                          : null,
                                      controller:
                                          AppCubit.get(context).university,
                                      hintText: "",
                                      obscureText: false,
                                    )),
                                normalText2(text: "Title"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 10),
                                  child: textFieldEmpty(
                                    controller: AppCubit.get(context).title,
                                    hintText: "",
                                    obscureText: false,
                                  ),
                                ),
                                normalText2(text: "Start year"),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                        top: 10),
                                    child: textFieldEmpty(
                                        controller:
                                            AppCubit.get(context).startEduDate,
                                        hintText: "",
                                        obscureText: false,
                                        onTap: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime.parse(
                                                      '2030-12-31'))
                                              .then((value) {
                                            AppCubit.get(context)
                                                    .startEduDate
                                                    .text =
                                                DateFormat.yMMMd()
                                                    .format(value!);
                                          });
                                        },
                                        suffix: const Icon(
                                            Icons.date_range_outlined))),
                                normalText2(text: "End year"),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                        top: 10),
                                    child: textFieldEmpty(
                                        controller:
                                            AppCubit.get(context).endEduDate,
                                        hintText: "",
                                        obscureText: false,
                                        onTap: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime.parse(
                                                      '2030-12-31'))
                                              .then((value) {
                                            AppCubit.get(context)
                                                    .endEduDate
                                                    .text =
                                                DateFormat.yMMMd()
                                                    .format(value!);
                                          });
                                        },
                                        suffix: const Icon(
                                            Icons.date_range_outlined))),
                                defaultButton(
                                    text: "Save",
                                    onPressed: () {
                                      if (eduForm.currentState!.validate()) {
                                        Navigator.pushNamed(
                                            context, AppRouter.completeProfile);
                                        CacheHelper.putString(
                                          key: SharedKeys.university!,
                                          value: AppCubit.get(context)
                                              .university
                                              .text,
                                        );
                                        CacheHelper.putString(
                                          key: SharedKeys.title!,
                                          value:
                                              AppCubit.get(context).title.text,
                                        );

                                        setState(() {
                                          isComplete = true;
                                        });
                                      } else {
                                        null;
                                      }
                                    }),
                              ],
                            ),
                          ),
                        )),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: isComplete,
                      child: Container(
                        height: 120,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppTheme.borderColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.school_outlined,
                                color: Colors.red,
                                size: 35,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    headline4(
                                        text: AppCubit.get(context)
                                            .university
                                            .text),
                                    normalText(
                                        text: AppCubit.get(context).title.text),
                                    normalText(
                                        text:
                                            "${AppCubit.get(context).startEduDate.text}-${AppCubit.get(context).endEduDate.text}")
                                  ],
                                ),
                              ),
                              const SizedBox(width: 70),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 25,
                                    color: AppTheme.buttonColor,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
