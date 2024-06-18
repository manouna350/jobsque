import 'package:flutter/material.dart';
import 'package:jobsque/model/widgets.dart';

class SuccessCreate extends StatelessWidget {
  const SuccessCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/Success Account Ilustration.jpg",
            ),
            const SizedBox(
              height: 10,
            ),
            headline(text: "Your account has been set up!"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: normalText(
                  text:
                      "we have customized feeds according to your preferences"),
            ),
            const SizedBox(
              height: 200,
            ),
            defaultButton(text: "Get started", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
