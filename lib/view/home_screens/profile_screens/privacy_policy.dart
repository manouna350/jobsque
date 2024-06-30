import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/cubit/app_cubit.dart';
import 'package:jobsque/model/cubit/app_states.dart';

import '../../../model/widgets.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
                title: headline(text: "Privacy Policy"),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headline(text: "Your privacy is important"),
                    const SizedBox(height: 10),
                    normalText(
                        text:
                            "Proin ac leo at eros interdum porttitor eget eget quam. In gravida bibendum lacinia. Suspendisse laoreet ante non venenatis rhoncus.Proin ac leo at eros interdum porttitor eget eget quam. In gravida bibendum lacinia. Suspendisse laoreet ante non venenatis rhoncus Donec rutrum arcu libero, ut commodo nisi bibendum eget. Quisque elementum aliquet magna rutrum auctor. Suspendisse eget nibh ut mauris tincidunt tristique eget vel augue. Nam ipsum nisi, condimentum et placerat ut, cursus id ex. Morbi at ante elementum, ultrices lectus scelerisque, accumsan nisi. Nunc libero lacus, eleifend a tempor et, rhoncus quis nunc."),
                    const SizedBox(height: 10),
                    headline(text: "Data controllers and contract partners"),
                    const SizedBox(height: 10),
                    normalText(
                        text:
                            "Proin ac leo at eros interdum porttitor eget eget quam.Proin ac leo at eros interdum porttitor eget eget quam. In gravida bibendum lacinia. Suspendisse laoreet ante non venenatis rhoncusProin ac leo at eros interdum porttitor eget eget quam. In gravida bibendum lacinia. Proin ac leo at eros interdum porttitor eget eget quam. In gravida bibendum lacinia. Suspendisse laoreet ante non venenatis rhoncus Suspendisse laoreet ante non venenatis rhoncus In gravida bibendum lacinia. Suspendisse laoree"),
                  ],
                ),
              ));
        });
  }
}
