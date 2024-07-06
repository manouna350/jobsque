import 'package:flutter/material.dart';
import '../../../model/colors_themes/color_palette.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  final List<String> location = ["Work from office", "Remote work"];
  bool isSelected1 = false;
  bool isSelected2 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: Text(location.elementAt(0)),
          selected: isSelected1,
          selectedColor: AppTheme.selectedText,
          labelStyle: TextStyle(
              color: isSelected1 == true
                  ? AppTheme.primaryColor
                  : AppTheme.sentence),
          onSelected: (newState) {
            setState(() {
              isSelected1 = newState;
            });
          },
        ),
        const SizedBox(width: 20),
        ChoiceChip(
          label: Text(location.elementAt(1)),
          selected: isSelected2,
          selectedColor: AppTheme.selectedText,
          labelStyle: TextStyle(
              color: isSelected2 == true
                  ? AppTheme.primaryColor
                  : AppTheme.sentence),
          onSelected: (newState) {
            setState(() {
              isSelected2 = newState;
            });
          },
        ),
      ],
    );
  }
}
