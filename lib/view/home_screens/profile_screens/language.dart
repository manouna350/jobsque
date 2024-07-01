import 'dart:core';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import '../../../model/widgets.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int selectedValue = 2;
  final List<Map<String, dynamic>> flag = [
    {"id": 0, "flag": "US", "country name": "English"},
    {"id": 1, "flag": "EG", "country name": "Arabic"},
    {"id": 2, "flag": "MY", "country name": "Malaysia"},
    {"id": 3, "flag": "IN", "country name": "India"},
    {"id": 4, "flag": "RU", "country name": "Russian"},
    {"id": 5, "flag": "DE", "country name": "Denmark"},
    {"id": 6, "flag": "JP", "country name": "Japanese"},
    {"id": 7, "flag": "SA", "country name": "Saudi"},
    {"id": 8, "flag": "IE", "country name": "Ireland"},
    {"id": 9, "flag": "JO", "country name": "Jordan"},
    {"id": 10, "flag": "DZ", "country name": "Algeria"},
    {"id": 11, "flag": "BH", "country name": "Bahrain"},
    {"id": 12, "flag": "CA", "country name": "Canada"},
    {"id": 13, "flag": "CN", "country name": "Chinese"},
    {"id": 14, "flag": "FR", "country name": "France"},
  ];

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
                title: headline(text: "Language"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                    itemCount: flag.length,
                    itemBuilder: (context, index) => RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.values[3],
                          children: [
                            CountryFlag.fromCountryCode(
                              "${flag.elementAt(index)["flag"]}",
                              width: 40,
                              height: 25,
                              shape: const RoundedRectangle(5),
                            ),
                            headline2(
                                text:
                                    "${flag.elementAt(index)["country name"]}"),
                            const SizedBox(
                              width: 150,
                            ),
                          ],
                        ),
                        selected: false,
                        value: index,
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: AppTheme.buttonColor,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        })),
              ));
        });
  }
}
