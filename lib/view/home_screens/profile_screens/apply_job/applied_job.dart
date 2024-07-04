import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import '../../../../model/colors_themes/color_palette.dart';
import '../../../../model/cubit/app_cubit.dart';
import '../../../../model/cubit/app_states.dart';
import '../../../../model/widgets.dart';

class AppliedJob extends StatefulWidget {
  final String? position;
  final String? companyName;
  final String? picture;

  const AppliedJob({super.key, this.position, this.companyName, this.picture});

  @override
  State<AppliedJob> createState() => _AppliedJobState();
}

class _AppliedJobState extends State<AppliedJob> {
  GlobalKey<FormState> stepperForm2 = GlobalKey();
  int currentStep = 0;
  int selectedValue = 1;
  bool isCompleted = false;
  bool pickedFile = false;
  String fileName = "My CV";
  List<Step> childSteps() => [
        Step(
            stepStyle: const StepStyle(
              color: AppTheme.buttonColor,
              connectorThickness: 3,
            ),
            isActive: currentStep >= 0,
            title: const Text(
              ' Biodata',
              style: TextStyle(fontSize: 13),
            ),
            state: currentStep >= 0 ? StepState.complete : StepState.indexed,
            content: Form(
              key: stepperForm2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headline2(text: "Biodata"),
                  normalText(text: "Fill in your bio data correctly"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      headline3(text: "Full name"),
                      const Text(
                        ("*"),
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  textField(
                      onChanged: (name) {
                        AppCubit.get(context).name.text = name;
                      },
                      validator: (name) => name!.length < 3 || name.length > 15
                          ? "name should be more than 3 characters and less than 15"
                          : null,
                      controller: AppCubit.get(context).name,
                      hintText: "Full name",
                      prefix: const Icon(Icons.person_outlined),
                      obscureText: false),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      headline3(text: "Email"),
                      const Text(
                        ("*"),
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  textField(
                      onChanged: (email) {
                        AppCubit.get(context).email.text = email;
                      },
                      validator: (email) {
                        if (email!.isEmpty || email.length < 3) {
                          return "Please enter a valid email";
                        } else {
                          return null;
                        }
                      },
                      controller: AppCubit.get(context).email,
                      hintText: "Email",
                      prefix: const Icon(Icons.email_outlined),
                      obscureText: false),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      headline3(text: "NO.phone"),
                      const Text(
                        ("*"),
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  defaultPhoneField(
                    controller: AppCubit.get(context).number,
                    hintText: "Phone number",
                    validator: (numb) {
                      if (numb!.isEmpty || numb.length < 10) {
                        return "Please enter a valid phone number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            )),
        Step(
          stepStyle: const StepStyle(
            color: AppTheme.buttonColor,
            connectorThickness: 3,
          ),
          isActive: currentStep >= 1,
          title: const Text(
            'Type of work',
            selectionColor: AppTheme.buttonColor,
            style: TextStyle(fontSize: 13),
          ),
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headline2(text: "Type of work"),
              normalText(text: "Fill in your bio data correctly"),
              const SizedBox(height: 20),
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  color: selectedValue == 1
                      ? AppTheme.clickedBoxColor
                      : AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: selectedValue == 1
                          ? AppTheme.buttonColor
                          : AppTheme.borderColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headline4(text: "Senior UX Designer"),
                          const SizedBox(
                            height: 10,
                          ),
                          normalText(text: "CV.pdf  . Portfolio.pdf")
                        ],
                      ),
                      Radio(
                          value: 1,
                          activeColor: AppTheme.buttonColor,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          })
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  color: selectedValue == 2
                      ? AppTheme.clickedBoxColor
                      : AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: selectedValue == 2
                          ? AppTheme.buttonColor
                          : AppTheme.borderColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headline4(text: "Senior UI Designer"),
                          const SizedBox(
                            height: 10,
                          ),
                          normalText(text: "CV.pdf  . Portfolio.pdf")
                        ],
                      ),
                      Radio(
                          value: 2,
                          activeColor: AppTheme.buttonColor,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          })
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  color: selectedValue == 3
                      ? AppTheme.clickedBoxColor
                      : AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: selectedValue == 3
                          ? AppTheme.buttonColor
                          : AppTheme.borderColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headline4(text: "Graphic Designer"),
                          const SizedBox(
                            height: 10,
                          ),
                          normalText(text: "CV.pdf  . Portfolio.pdf")
                        ],
                      ),
                      Radio(
                          value: 3,
                          activeColor: AppTheme.buttonColor,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          })
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  color: selectedValue == 4
                      ? AppTheme.clickedBoxColor
                      : AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: selectedValue == 4
                          ? AppTheme.buttonColor
                          : AppTheme.borderColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headline4(text: "Front-End Developer"),
                          const SizedBox(
                            height: 10,
                          ),
                          normalText(text: "CV.pdf  . Portfolio.pdf")
                        ],
                      ),
                      Radio(
                          value: 4,
                          activeColor: AppTheme.buttonColor,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          })
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Step(
          stepStyle: const StepStyle(
            color: AppTheme.buttonColor,
            connectorThickness: 3,
          ),
          isActive: currentStep >= 2,
          title: const Text(
            'Upload portfolio',
            selectionColor: AppTheme.buttonColor,
            style: TextStyle(fontSize: 13),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headline2(text: "Upload your portfolio"),
              normalText(text: "Fill in your bio data correctly"),
              const SizedBox(height: 10),
              Row(children: [
                headline3(text: "Upload CV"),
                const Text(
                  ("*"),
                  style: TextStyle(color: Colors.red),
                ),
              ]),
              Visibility(
                visible: pickedFile,
                child: Container(
                  height: 80,
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
                          Icons.picture_as_pdf,
                          color: Colors.red,
                          size: 35,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            headline4(text: fileName),
                            normalText(text: "CV.pdf 300KB")
                          ],
                        ),
                        const SizedBox(width: 90),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              size: 25,
                              color: AppTheme.buttonColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.highlight_remove,
                              size: 25,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DottedBorder(
                borderType: BorderType.RRect,
                color: AppTheme.buttonColor,
                strokeWidth: 2,
                dashPattern: const [8, 4],
                radius: const Radius.circular(15),
                child: Container(
                  height: 250,
                  width: 500,
                  decoration: BoxDecoration(
                      color: const Color(0xffECF2FF),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xffD6E4FF),
                          radius: 25,
                          child: Icon(
                            Icons.upload_file_rounded,
                            color: AppTheme.buttonColor,
                            size: 30,
                          ),
                        ),
                        headline4(text: 'Upload your other file'),
                        normalText(text: "Max.file size 10 MG"),
                        InkWell(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              setState(() {
                                pickedFile = true;
                              });
                            } else {
                              null;
                            }
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffD6E4FF),
                                border:
                                    Border.all(color: AppTheme.buttonColor)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload_rounded,
                                  color: AppTheme.buttonColor,
                                ),
                                Text(
                                  " Add file  ",
                                  style: TextStyle(
                                      color: AppTheme.buttonColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ];
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
              title: headline(text: "Applied Job"),
            ),
            body: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadiusDirectional.circular(15)),
                          child: Image.network(
                            alignment: Alignment.center,
                            widget.picture!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(height: 10),
                        headline2(text: widget.position!),
                        normalText(
                            text: "${widget.companyName!}. Jakarta,Indonesia"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stepper(
                    stepIconMargin: const EdgeInsets.all(3),
                    controlsBuilder: (context, onStepContinue) => defaultButton(
                        text: currentStep == 2 ? "Submit" : "Next",
                        onPressed: () {
                          final isLastStep =
                              currentStep == childSteps().length - 1;
                          if (isLastStep) {
                            setState(() {
                              isCompleted = true;
                              Navigator.pushNamed(
                                  context, AppRouter.homeScreen);
                            });
                          } else {
                            setState(() {
                              currentStep += 1;
                            });
                          }
                        }),
                    stepIconHeight: 50,
                    elevation: 0,
                    type: StepperType.horizontal,
                    steps: childSteps(),
                    currentStep: currentStep,
                    onStepTapped: (step) => setState(() {
                      currentStep = step;
                    }),
                    // controlsBuilder: (BuildContext context, {onStepContinue}) {
                    //   return Container();
                    // },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
