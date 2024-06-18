import 'package:flutter/material.dart';
import 'package:jobsque/model/colors_themes/color_palette.dart';

class GridItem extends StatefulWidget {
  const GridItem({super.key});

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  final List<Map<String, String>> gridMap = [
    {"image": "assets/images/bezier.png", "title": "UI/UX Designer"},
    {"image": "assets/images/pen-tool-2.png", "title": "Illustrator Designer"},
    {"image": "assets/images/code.png", "title": "Developer"},
    {"image": "assets/images/graph.png", "title": "Management"},
    {"image": "assets/images/Vector.png", "title": "Information Technology"},
    {"image": "assets/images/cloud-add.png", "title": "Research and analytics"}
  ];
  int selectedIndex = -1;
  Color color = AppTheme.boxColor;
  Color border = AppTheme.borderColor;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(5),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 125),
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: selectedIndex == index
                            ? AppTheme.textButtonColor
                            : AppTheme.borderColor),
                    borderRadius: BorderRadius.circular(20),
                    color: selectedIndex == index
                        ? AppTheme.clickedBoxColor
                        : AppTheme.boxColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppTheme.primaryColor,
                          radius: 20,
                          child: Image.asset(
                              "${gridMap.elementAt(index)["image"]}"),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${gridMap.elementAt(index)["title"]}",
                          style: const TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  )),
            ),
        shrinkWrap: true,
        itemCount: gridMap.length);
  }
}
