import 'package:care453/core/utils/casched_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../auth/Screens/sign_in_employeee.dart';

class EmployeeIntroductionScreen extends StatefulWidget {
  const EmployeeIntroductionScreen({super.key});

  @override
  EmployeeIntroductionScreenState createState() =>
      EmployeeIntroductionScreenState();
}

class EmployeeIntroductionScreenState
    extends State<EmployeeIntroductionScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 14.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 9, 104, 247)),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top: 50),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 5000,
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(child: SizedBox()),
      ),
      globalFooter: SizedBox(),
      pages: [
        PageViewModel(
          title: "Care 453 Health Company",
          body:
              "Providing dedicated and professional care to patients in their homes, ensuring their comfort and well-being.",
          image: _buildImage('house.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Care 453 Health Company",
          body:
              "Empowering you as a caregiver to deliver personalized and attentive care to patients at home.",
          image: _buildImage('house.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Care 453 Health Company",
          body:
              "Supporting you in providing comprehensive health assistance to patients in a home-based setting.",
          image: _buildImage('nurses.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Care 453 Health Company",
          body:
              "Investing in your professional growth as a caregiver to enhance the quality of care you provide.",
          image: _buildImage('admin3.png'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 4,
            imageFlex: 4,
          ),
        ),
        PageViewModel(
          title: "Care 453 Health Company",
          body:
              "Equipping you with the tools and resources needed to deliver reliable and compassionate care.",
          image: _buildImage('care_image.png'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 4,
            imageFlex: 4,
          ),
        ),
      ],
      onDone: () async {
        await CacheUtils.updateOnboardingStatus(true).then((_) {
          Get.off(LoginEmployee());
        });
      },
      onSkip: () async {
        await CacheUtils.updateOnboardingStatus(true).then((_) {
          Get.off(LoginEmployee());
        });
      }, // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 9, 104, 247))),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 9, 104, 247))),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: Color.fromARGB(255, 9, 104, 247),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onBackToIntro(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const EmployeeIntroductionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onBackToIntro(context),
              child: const Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}
