import 'package:flutter/material.dart';
import '../../routes/route_name.dart';
import 'onboarding_model.dart';

class BuilderOnBoarding extends StatefulWidget {
  final OnBoardingModel onBoardingModel;

  const BuilderOnBoarding({super.key, required this.onBoardingModel});

  @override
  State<BuilderOnBoarding> createState() => _BuilderOnBoardingState();
}

class _BuilderOnBoardingState extends State<BuilderOnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: [
              Image.asset(
                "assets/images/Logo.jpg",
                height: 20,
              ),
              const SizedBox(
                width: 230,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRouter.login, (route) => false);
                },
                child: const Text('Skip',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ),
            ],
          ),
        ),
        Image.asset(
          "${widget.onBoardingModel.image2}",
          width: double.infinity,
          height: 350,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "${widget.onBoardingModel.dis}",
            style: (const TextStyle(fontSize: 27)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "${widget.onBoardingModel.dis2}",
            style: (const TextStyle(fontSize: 12, color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
