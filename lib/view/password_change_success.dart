import 'package:flutter/material.dart';

import '../model/widgets.dart';
import '../view_model/routes/route_name.dart';

class PasswordChangeSuccess extends StatelessWidget {
  const PasswordChangeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/Password Succesfully Ilustration.jpg",
            ),
            const SizedBox(
              height: 10,
            ),
            headline(text: "Password changed successfully !"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: normalText(
                  text:
                      "your password has been changer successfully, we will let you know if there are more problems with your account "),
            ),
            const SizedBox(
              height: 170,
            ),
            defaultButton(text: "Open email app", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
