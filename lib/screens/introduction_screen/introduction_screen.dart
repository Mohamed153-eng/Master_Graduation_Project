import 'package:flutter/material.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/screens/sign_screens/login_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  static const String introductionScreenRoute = 'Introduction Screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Welcome In Pharmacy",
      body:
          "The program is supervised by the most skilled pharmacists to answer your inquiries",
      image: const Center(
        child: Text(
          "👋",
          style: TextStyle(fontSize: 100.0),
        ),
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: defBlue,
        ),
        bodyTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          color: defBlue,
        ),
      ),
    ),
    PageViewModel(
      title: "Shortest delivery time",
      body:
          "Specialized in all kinds of international medicines, working 24 hours at your service",
      image: Center(
        child: Image.asset(
          'assets/images/fastdl.png', height: 120,
          // change
        ),
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: defBlue,
        ),
        bodyTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          color: defBlue,
        ),
      ),
    ),
    PageViewModel(
      title: "We come to you wherever you are",
      body: "",
      image: Center(
          child: Image.asset(
        'assets/images/black-map.png',
        height: 200,
      )),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: defBlue,
        ),
      ),
    ),
  ];

  void _onIntroEnd(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
    Navigator.of(context, rootNavigator: true)
        .pushNamed(LoginScreen.loginScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      done: const Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
    );
  }
}
