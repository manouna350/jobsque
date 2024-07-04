import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import '../../../model/widgets.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final GlobalKey<FormState> personalDetForm = GlobalKey();

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
                title: headline(text: "Personal details"),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: Form(
                    key: personalDetForm,
                    child: Column(
                      children: [
                        Stack(alignment: Alignment.center, children: [
                          Container(
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(
                                "assets/images/Profile.png",
                              )),
                          IconButton(
                            iconSize: 40,
                            onPressed: () async {
                              await AppCubit.get(context)
                                  .uploadPhoto(cam: "camera");
                            },
                            icon: const Icon(Icons.camera_alt_outlined),
                            color: Colors.white,
                          ),
                        ]),
                        textButton(
                          text: "Change photo",
                          onPressed: () async {
                            await AppCubit.get(context)
                                .uploadPhoto(cam: "gallery");
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            normalText(text: "Name"),
                            textFieldEmpty(
                                onChanged: (name) {
                                  AppCubit.get(context).name.text = name;
                                },
                                controller: AppCubit.get(context).name,
                                hintText: "Name",
                                obscureText: false),
                            const SizedBox(height: 10),
                            normalText(text: "Bio"),
                            textFieldEmpty(
                                onChanged: (bio) {
                                  AppCubit.get(context).bio.text = bio;
                                },
                                controller: AppCubit.get(context).bio,
                                hintText: "Bio",
                                obscureText: false),
                            const SizedBox(height: 10),
                            normalText(text: "Address"),
                            textFieldEmpty(
                                onChanged: (address) {
                                  AppCubit.get(context).address.text = address;
                                },
                                controller: AppCubit.get(context).address,
                                hintText: "Address",
                                obscureText: false),
                            const SizedBox(height: 10),
                            normalText(text: "Phone"),
                            textFieldEmpty(
                                onChanged: (numb) {
                                  AppCubit.get(context).number.text = numb;
                                },
                                controller: AppCubit.get(context).number,
                                hintText: "Phone",
                                obscureText: false),
                            const SizedBox(height: 30),
                            defaultButton(
                                text: "Save",
                                onPressed: () {
                                  AppCubit.get(context).updateProfile1();
                                  AppCubit.get(context).percent = 0.25;
                                  Navigator.pushNamed(
                                      context, AppRouter.completeProfile);
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
