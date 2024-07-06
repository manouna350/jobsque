import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/model/widgets.dart';

import '../../../model/colors_themes/color_palette.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  final List<Map<String, String>> flag = [
    {"flag": "US", "country name": "USA"},
    {"flag": "EG", "country name": "Egypt"},
    {"flag": "MY", "country name": "Malaysia"},
    {"flag": "IN", "country name": "India"},
    {"flag": "RU", "country name": "Russia"},
    {"flag": "DE", "country name": "Denmark"},
    {"flag": "JP", "country name": "Japan"},
    {"flag": "SA", "country name": "Saudi"},
    {"flag": "IE", "country name": "Ireland"},
    {"flag": "JO", "country name": "Jordan"},
    {"flag": "DZ", "country name": "Algeria"},
    {"flag": "BH", "country name": "Bahrain"},
    {"flag": "CA", "country name": "Canada"},
    {"flag": "CN", "country name": "China"},
    {"flag": "FR", "country name": "France"},
  ];
  bool isSelected = false;
  var selectedIndex = -1;
  List<Map<String, String>> selected = [];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: flag.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: 50),
      itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              border: Border.all(
                  color: selectedIndex == index
                      ? AppTheme.textButtonColor
                      : AppTheme.borderColor),
              borderRadius: BorderRadius.circular(25),
              color: selectedIndex == index
                  ? AppTheme.clickedBoxColor
                  : AppTheme.boxColor,
            ),
            child: Row(
              children: [
                CountryFlag.fromCountryCode("${flag.elementAt(index)["flag"]}",
                    shape: const Circle()),
                const SizedBox(
                  width: 10,
                ),
                normalText(
                  text: "${flag.elementAt(index)["country name"]}",
                )
              ],
            ),
          )
          // InputChip(
          //   padding: const EdgeInsets.all(5),
          //   selected: isSelected,
          //   selectedColor: AppTheme.clickedBoxColor,
          //   backgroundColor: AppTheme.boxColor,
          //   showCheckmark: false,
          //   onSelected: (bool bool) {
          //     setState(() {
          //       isSelected = !isSelected;
          //     });
          //   },
          //   label: Text(
          //     "${flag.elementAt(index)["country name"]}",
          //     style: const TextStyle(fontSize: 15, overflow: TextOverflow.fade),
          //   ),
          //   avatar: CountryFlag.fromCountryCode(
          //       "${flag.elementAt(index)["flag"]}",
          //       shape: const Circle()),
          // ),
          ),
    );
  }
}
