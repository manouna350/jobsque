import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import '../../../model/widgets.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  bool pickedFile = false;

  String fileName = "My CV";

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
              title: headline(text: "Portfolio"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headline4(text: "Add portfolio here"),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DottedBorder(
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
                                        border: Border.all(
                                            color: AppTheme.buttonColor)),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                    ),
                    Visibility(
                      visible: pickedFile,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 20, right: 20),
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
                                const SizedBox(width: 70),
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
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
