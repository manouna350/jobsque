class OnBoardingModel {
  String? image2;
  String? dis;
  String? dis2;

  OnBoardingModel({
    this.image2,
    this.dis,
    this.dis2,
  });
}

final List<OnBoardingModel> dataOnBoarding = [
  OnBoardingModel(
      image2: "assets/images/Background -onboarding1.jpg",
      dis: "Find a job,and start building your career from now on ",
      dis2:
          "Explore over 25,924 available job roles and upgrade your operator now"),
  OnBoardingModel(
      image2: "assets/images/Background-onboarding2.jpg",
      dis: "Hundreds of jobs are waiting for you to join together",
      dis2:
          "immediately join us and start applying for the job you are interested in"),
  OnBoardingModel(
      image2: "assets/images/Background-onboarding3.jpg",
      dis: "Get the best choice for the job you've always dreamed of ",
      dis2:
          "The better the skills you have, the greater the good job opportunities for you"),
];
