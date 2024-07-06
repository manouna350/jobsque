import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/model/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../model/cubit/app_cubit.dart';
import '../model/cubit/app_states.dart';
import '../model/shared/cache_helper.dart';
import '../model/shared/enum.dart';
import '../view_model/builder_items/onboarding/builder_onboarding.dart';
import '../view_model/builder_items/onboarding/onboarding_model.dart';
import '../view_model/routes/route_name.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  var isLast = false;
  void finishOnBoarding(context, String screen) {
    CacheHelper.putBOOL(key: SharedKeys.onBoarding, value: isLast);
    Navigator.pushNamedAndRemoveUntil(context, screen, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit.get(context);
          return Scaffold(
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return BuilderOnBoarding(
                        onBoardingModel: dataOnBoarding[index],
                      );
                    },
                    itemCount: dataOnBoarding.length,
                    onPageChanged: (int index) {
                      if (index == dataOnBoarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        isLast = false;
                      }
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: dataOnBoarding.length,
                  axisDirection: Axis.horizontal,
                  effect: const SlideEffect(
                    spacing: 4.0,
                    radius: 50.0,
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                defaultButton(
                    text: ((isLast == false ? "Next" : "Continue")),
                    onPressed: () {
                      setState(() {
                        if (isLast == true) {
                          finishOnBoarding(context, AppRouter.login);
                        } else {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.bounceIn);
                        }
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
              ]));
        });
  }
}
