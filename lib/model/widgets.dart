import 'package:flutter/material.dart';
import 'colors_themes/color_palette.dart';

Widget defaultButton({
  double width = 360,
  double height = 55,
  double radius = 20,
  required String text,
  Color backGround = AppTheme.buttonColor,
  required final VoidCallback onPressed,
}) =>
    // Container(
    //   width: width,
    //   height: height,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(30),
    //     color: backGround,
    //   ),
    //   child:
    ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.buttonColor,
          minimumSize: const Size(360, 55)),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: AppTheme.primaryColor,
        ),
      ),
    );
Widget headline({
  required String text,
}) =>
    Text(
      text,
      style: const TextStyle(
        fontSize: 23,
        color: AppTheme.headlineColor,
        fontWeight: FontWeight.bold,
      ),
    );

Widget normalText({
  required String text,
}) =>
    Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        color: AppTheme.sentence,
        overflow: TextOverflow.fade,
      ),
    );

Widget textField({
  required TextEditingController controller,
  TextInputType? type,
  required String hintText,
  IconButton? suffix,
  required Icon prefix,
  required bool obscureText,
  String? Function(String?)? validator,
}) =>
    TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffix,
          prefixIcon: prefix,
          iconColor: AppTheme.primaryColor,
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppTheme.borderColor, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppTheme.buttonColor, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10))),
    );

Widget textButton({
  required String text,
  required Function onPressed,
}) =>
    TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(color: AppTheme.textButtonColor, fontSize: 15),
        ));
