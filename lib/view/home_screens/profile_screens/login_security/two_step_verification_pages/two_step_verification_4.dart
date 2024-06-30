import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import '../../../../../model/colors_themes/color_palette.dart';
import '../../../../../model/widgets.dart';

class TwoStepVerification4 extends StatefulWidget {
  const TwoStepVerification4({super.key});

  @override
  State<TwoStepVerification4> createState() => _TwoStepVerification4State();
}

class _TwoStepVerification4State extends State<TwoStepVerification4> {
  bool invalidOtp = false;
  int resendTime = 60;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  String strFormatting(n) => n.toString().padLeft(2, '0');
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
                title: headline(text: "Two-step verification"),
              ),
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headline2(text: "Enter the 6 digit code"),
                      const SizedBox(
                        height: 10,
                      ),
                      normalText(
                          text:
                              "Please confirm your account by entering the \n authorization code sent to *****789."),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AppTheme.borderColor,
                                  )),
                              child: TextField(
                                cursorOpacityAnimates: false,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AppTheme.borderColor,
                                  )),
                              child: TextField(
                                cursorOpacityAnimates: false,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AppTheme.borderColor,
                                  )),
                              child: TextField(
                                cursorOpacityAnimates: false,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AppTheme.borderColor,
                                  )),
                              child: TextField(
                                cursorOpacityAnimates: false,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AppTheme.borderColor,
                                  )),
                              child: TextField(
                                cursorOpacityAnimates: false,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AppTheme.borderColor,
                                  )),
                              child: TextField(
                                cursorOpacityAnimates: false,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          normalText(text: "Resend code after"),
                          const SizedBox(width: 20),
                          resendTime == 0
                              ? InkWell(
                                  onTap: () {
                                    invalidOtp = false;
                                    resendTime = 60;
                                    startTimer();
                                  },
                                  child: const Text(
                                    'Send new code?',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                  ),
                                )
                              : const SizedBox(),
                          resendTime != 0
                              ? Text(
                                  ' 0:${strFormatting(resendTime)}.',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.red),
                                )
                              : const SizedBox(),
                          const SizedBox(height: 5),
                        ],
                      ),
                      Text(
                        invalidOtp ? 'Invalid otp!' : '',
                        style: const TextStyle(fontSize: 20, color: Colors.red),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(
                        height: 250,
                      ),
                      defaultButton(
                        text: "Verify",
                        onPressed: () {
                          final otp =
                              txt1.text + txt2.text + txt3.text + txt4.text;
                          if (otp == '123456') {
                            stopTimer();
                            Navigator.pushNamed(context, AppRouter.homeScreen);
                          } else {
                            setState(() {
                              invalidOtp = true;
                            });
                          }
                          //
                        },
                      )
                    ]),
              )));
        });
  }
}
