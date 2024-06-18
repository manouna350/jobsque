import 'package:flutter/material.dart';
import 'package:jobsque/view/create_new_password.dart';
import 'package:jobsque/view/home_screen.dart';
import 'package:jobsque/view/login_page.dart';
import 'package:jobsque/view/onboarding_screen.dart';
import 'package:jobsque/view/password_change_success.dart';
import 'package:jobsque/view/preferred_location.dart';
import 'package:jobsque/view/reset_password.dart';
import 'package:jobsque/view/splash_screen.dart';
import 'package:jobsque/view/work_type.dart';
import 'package:jobsque/view_model/routes/route_name.dart';
import '../../view/check_email.dart';
import '../../view/create_account.dart';
import '../../view/success_create.dart';

Route<dynamic>? onGenerate(RouteSettings setting) {
  switch (setting.name) {
    case AppRouter.splash:
      return MaterialPageRoute(builder: (context) => SplashScreen());
      break;
    case AppRouter.onBoarding:
      return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      break;
    case AppRouter.createAccount:
      return MaterialPageRoute(builder: (context) => CreateAccount());
      break;
    case AppRouter.login:
      return MaterialPageRoute(builder: (context) => LoginPage());
      break;
    case AppRouter.resetPassword:
      return MaterialPageRoute(builder: (context) => ResetPassword());
      break;
    case AppRouter.createNewPassword:
      return MaterialPageRoute(builder: (context) => CreateNewPassword());
      break;
    case AppRouter.workType:
      return MaterialPageRoute(builder: (context) => WorkType());
      break;
    case AppRouter.preferredLocation:
      return MaterialPageRoute(builder: (context) => PreferredLocation());
      break;
    case AppRouter.homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
      break;
    case AppRouter.createSuccess:
      return MaterialPageRoute(builder: (context) => SuccessCreate());
      break;
    case AppRouter.passwordChangeSuccess:
      return MaterialPageRoute(builder: (context) => PasswordChangeSuccess());
      break;
    case AppRouter.checkEmail:
      return MaterialPageRoute(builder: (context) => CheckEmail());
  }
}
