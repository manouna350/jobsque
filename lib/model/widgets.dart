import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'colors_themes/color_palette.dart';

Widget title({required String text}) => Container(
      height: 40,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: AppTheme.titleBox,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: AppTheme.sentence,
                overflow: TextOverflow.fade,
              ),
            )
          ],
        ),
      ),
    );
Widget defaultButton({
  double width = 360,
  double height = 55,
  double radius = 20,
  required String text,
  Color backGround = AppTheme.buttonColor,
  required final VoidCallback onPressed,
}) =>
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
Widget headline2({
  required String text,
}) =>
    Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: AppTheme.headlineColor,
        fontWeight: FontWeight.bold,
      ),
    );
Widget headline3({
  required String text,
}) =>
    Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: AppTheme.headlineColor,
      ),
    );
Widget headline4({
  required String text,
}) =>
    Text(
      text,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: AppTheme.headlineColor,
      ),
    );

Widget normalText({
  required String text,
}) =>
    Text(
      text,
      style: const TextStyle(
          leadingDistribution: TextLeadingDistribution.even,
          fontSize: 15,
          color: AppTheme.sentence),
    );
Widget normalText2({
  required String text,
}) =>
    Text(
      text,
      style: const TextStyle(
        fontSize: 18,
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
  void Function(String)? onChanged,
}) =>
    TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      keyboardType: type,
      onChanged: onChanged!,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
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
Widget textFieldEmpty({
  required TextEditingController controller,
  TextInputType? type,
  required String hintText,
  Icon? suffix,
  Icon? prefix,
  required bool obscureText,
  String? Function(String?)? validator,
  Function? onTap,
  void Function(String)? onChanged,
}) =>
    TextFormField(
      onChanged: onChanged!,
      onTap: () {
        onTap!();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
          prefixIcon: prefix,
          hintText: hintText,
          suffixIcon: suffix,
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
  required final VoidCallback onPressed,
}) =>
    TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: AppTheme.textButtonColor, fontSize: 15),
        ));

Widget searchField({
  TextEditingController? controller,
  required String hintText,
  IconButton? suffix,
}) =>
    Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: false,
          controller: controller,
          decoration: InputDecoration(
              enabled: true,
              isCollapsed: true,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 1),
              constraints: const BoxConstraints(maxHeight: 70),
              hintText: hintText,
              hintStyle: const TextStyle(color: AppTheme.hintText),
              prefixIcon: const Icon(
                Icons.search,
                size: 25,
              ),
              suffix: IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  size: 20,
                  color: Colors.black,
                ),
                onPressed: () {
                  controller?.clear();
                },
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppTheme.borderColor, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppTheme.borderColor,
                  style: BorderStyle.solid,
                ),
              )),
        ));
Widget defaultPhoneField(
        {TextEditingController? controller,
        String? Function(String?)? validator,
        Function(CountryCode)? onChange,
        String? hintText,
        String? labelText}) =>
    TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          prefixIcon: CountryCodePicker(
            closeIcon: const Icon(Icons.close),
            onChanged: onChange,
            initialSelection: 'EG',
            favorite: const ['+20', 'EG'],
          ),
          hintText: hintText,
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
