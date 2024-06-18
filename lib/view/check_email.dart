import 'package:flutter/material.dart';
import '../model/widgets.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

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
              "assets/images/Email Ilustration.jpg",
            ),
            const SizedBox(
              height: 10,
            ),
            headline(text: "Check your Email"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: normalText(
                  text: "We have sent a reset password to your email address"),
            ),
            const SizedBox(
              height: 200,
            ),
            defaultButton(text: "Open email app", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
