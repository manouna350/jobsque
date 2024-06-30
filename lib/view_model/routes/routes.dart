import 'package:flutter/material.dart';
import 'package:jobsque/view/create_new_password.dart';
import 'package:jobsque/view/home_screen.dart';
import 'package:jobsque/view/home_screens/applied_page.dart';
import 'package:jobsque/view/home_screens/complete_profile/complete_profile.dart';
import 'package:jobsque/view/home_screens/complete_profile/education.dart';
import 'package:jobsque/view/home_screens/complete_profile/experience.dart';
import 'package:jobsque/view/home_screens/complete_profile/personal_details.dart';
import 'package:jobsque/view/home_screens/complete_profile/portofoli_complete_profile.dart';
import 'package:jobsque/view/home_screens/notification_page.dart';
import 'package:jobsque/view/home_screens/profile_screens/apply_job/applied_job.dart';
import 'package:jobsque/view/home_screens/profile_screens/apply_job/apply_job_stepper.dart';
import 'package:jobsque/view/home_screens/profile_screens/apply_job/job_detail.dart';
import 'package:jobsque/view/home_screens/profile_screens/messages/chat.dart';
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
import '../../view/home_screens/profile_screens/accessibility.dart';
import '../../view/home_screens/profile_screens/edit_profile.dart';
import '../../view/home_screens/profile_screens/help_center.dart';
import '../../view/home_screens/profile_screens/language.dart';
import '../../view/home_screens/profile_screens/login_and_security.dart';
import '../../view/home_screens/profile_screens/login_security/change_password_security.dart';
import '../../view/home_screens/profile_screens/login_security/email_address_change.dart';
import '../../view/home_screens/profile_screens/login_security/phone_number_change.dart';
import '../../view/home_screens/profile_screens/login_security/two_step_verification_pages/two_step_verification.dart';
import '../../view/home_screens/profile_screens/login_security/two_step_verification_pages/two_step_verification_2.dart';
import '../../view/home_screens/profile_screens/login_security/two_step_verification_pages/two_step_verification_3.dart';
import '../../view/home_screens/profile_screens/login_security/two_step_verification_pages/two_step_verification_4.dart';
import '../../view/home_screens/profile_screens/notification.dart';
import '../../view/home_screens/profile_screens/portfolio.dart';
import '../../view/home_screens/profile_screens/privacy_policy.dart';
import '../../view/home_screens/profile_screens/search_page.dart';
import '../../view/home_screens/profile_screens/terms_and_conditions.dart';
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
      break;
    case AppRouter.editProfile:
      return MaterialPageRoute(builder: (context) => EditProfile());
      break;
    case AppRouter.helpCenter:
      return MaterialPageRoute(builder: (context) => HelpCenter());
      break;
    case AppRouter.language:
      return MaterialPageRoute(builder: (context) => Language());
      break;
    case AppRouter.loginAndSecurity:
      return MaterialPageRoute(builder: (context) => LoginAndSecurity());
      break;
    case AppRouter.notifications:
      return MaterialPageRoute(builder: (context) => Notifications());
      break;
    case AppRouter.portfolio:
      return MaterialPageRoute(builder: (context) => Portfolio());
      break;
    case AppRouter.privacyPolicy:
      return MaterialPageRoute(builder: (context) => PrivacyPolicy());
      break;
    case AppRouter.termsAndConditions:
      return MaterialPageRoute(builder: (context) => TermsAndConditions());
      break;
    case AppRouter.accessibility:
      return MaterialPageRoute(builder: (context) => Accessibility());
      break;
    case AppRouter.emailChange:
      return MaterialPageRoute(builder: (context) => EmailAddressChange());
      break;
    case AppRouter.phoneNumberChange:
      return MaterialPageRoute(builder: (context) => PhoneNumberChange());
      break;
    case AppRouter.changePasswordSecurity:
      return MaterialPageRoute(builder: (context) => ChangePasswordSecurity());
      break;
    case AppRouter.twoStepVerification1:
      return MaterialPageRoute(builder: (context) => TwoStepVerification1());
      break;
    case AppRouter.twoStepVerification2:
      return MaterialPageRoute(builder: (context) => TwoStepVerification2());
      break;
    case AppRouter.twoStepVerification3:
      return MaterialPageRoute(builder: (context) => TwoStepVerification3());
      break;
    case AppRouter.twoStepVerification4:
      return MaterialPageRoute(builder: (context) => TwoStepVerification4());
      break;
    case AppRouter.notification:
      return MaterialPageRoute(builder: (context) => NotificationPage());
      break;
    case AppRouter.search:
      return MaterialPageRoute(builder: (context) => SearchPage());
      break;
    case AppRouter.portfolioCompleteProfile:
      return MaterialPageRoute(
          builder: (context) => PortfolioCompleteProfile());
      break;
    case AppRouter.personalDetails:
      return MaterialPageRoute(builder: (context) => PersonalDetails());
      break;
    case AppRouter.completeProfile:
      return MaterialPageRoute(builder: (context) => CompleteProfile());
      break;
    case AppRouter.education:
      return MaterialPageRoute(builder: (context) => Education());
      break;
    case AppRouter.experience:
      return MaterialPageRoute(builder: (context) => Experience());
      break;
    case AppRouter.applyJobStepper:
      return MaterialPageRoute(builder: (context) => ApplyJobStepper());
      break;
    case AppRouter.chat:
      return MaterialPageRoute(builder: (context) => Chat());
      break;
    case AppRouter.jobDetail:
      return MaterialPageRoute(builder: (context) => JobDetail());
      break;
    case AppRouter.appliedJob:
      return MaterialPageRoute(builder: (context) => AppliedJob());
  }
  return null;
}
