import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../model/colors_themes/color_palette.dart';
import '../../../model/cubit/app_cubit.dart';
import '../../../model/cubit/app_states.dart';
import '../../../model/shared/cache_helper.dart';
import '../../../model/shared/enum.dart';
import '../../../model/widgets.dart';
import '../../../view_model/routes/route_name.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  GlobalKey<FormState> expForm = GlobalKey();
  bool isComplete = false;
  List workType = ["Remote", "Full time", "Part time", "Hybrid"];
  String? chooseType;
  late bool isChecked = false;

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
              title: headline(text: "Experience"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                        height: 700,
                        width: 500,
                        decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppTheme.borderColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: expForm,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                normalText2(text: "Position *"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 10),
                                  child: textFieldEmpty(
                                    controller: AppCubit.get(context).position,
                                    hintText: "",
                                    obscureText: false,
                                    validator: (university) =>
                                        university!.length < 3
                                            ? "Please enter your position "
                                            : null,
                                  ),
                                ),
                                normalText2(text: "Type of work"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 20, right: 20),
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppTheme.borderColor)),
                                    child: DropdownButton(
                                      padding: const EdgeInsets.all(10),
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      iconSize: 36,
                                      isExpanded: true,
                                      underline: const SizedBox(),
                                      hint: const Text("work type"),
                                      value: chooseType,
                                      onChanged: (newValue) {
                                        setState(() {
                                          chooseType = newValue as String?;
                                        });
                                      },
                                      items: workType.map((valueItem) {
                                        return DropdownMenuItem(
                                            value: valueItem,
                                            child: Text(valueItem));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                normalText2(text: "Company name *"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 10),
                                  child: textFieldEmpty(
                                    controller:
                                        AppCubit.get(context).companyName,
                                    hintText: "",
                                    obscureText: false,
                                    validator: (university) =>
                                        university!.length < 3
                                            ? "Please enter company name"
                                            : null,
                                  ),
                                ),
                                normalText2(text: "Location"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  child: textFieldEmpty(
                                    prefix:
                                        const Icon(Icons.location_on_outlined),
                                    controller: AppCubit.get(context).title,
                                    hintText: "",
                                    obscureText: false,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                        activeColor: AppTheme.buttonColor,
                                        value: isChecked,
                                        onChanged: (changed) {
                                          setState(() {
                                            isChecked = changed!;
                                          });
                                        }),
                                    headline4(
                                        text:
                                            "I am currently working in this role.")
                                  ],
                                ),
                                normalText2(text: "Start year"),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                        top: 10),
                                    child: textFieldEmpty(
                                        controller:
                                            AppCubit.get(context).startWorkDate,
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
                                                    .startWorkDate
                                                    .text =
                                                DateFormat.yMMMd()
                                                    .format(value!);
                                          });
                                        },
                                        suffix: const Icon(
                                            Icons.date_range_outlined))),
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultButton(
                                    text: "Save",
                                    onPressed: () {
                                      if (expForm.currentState!.validate()) {
                                        Navigator.pushNamed(
                                            context, AppRouter.completeProfile);
                                        CacheHelper.putString(
                                          key: SharedKeys.position!,
                                          value: AppCubit.get(context)
                                              .position
                                              .text,
                                        );
                                        CacheHelper.putString(
                                          key: SharedKeys.companyName!,
                                          value: AppCubit.get(context)
                                              .companyName
                                              .text,
                                        );

                                        setState(() {
                                          isComplete = true;
                                        });
                                      } else {
                                        null;
                                      }
                                    })
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
                                Icons.work,
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
                                            .position
                                            .text),
                                    normalText(text: chooseType.toString()),
                                    normalText(
                                        text: AppCubit.get(context)
                                            .startWorkDate
                                            .text)
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
