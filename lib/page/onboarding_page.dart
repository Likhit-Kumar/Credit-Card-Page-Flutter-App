import 'package:cardsapp/Screens/Welcome/welcome.dart';
import 'package:cardsapp/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:cardsapp/page/home_page.dart';
import 'package:cardsapp/widget/button_widget.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Page 1',
              body: 'Page 1 - Onboarding Page Slide',
              image: buildImage('assets/onboard/onboard1.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Page 2',
              body: 'Page 2 - Onboarding Page Slide',
              image: buildImage('assets/onboard/onboard2.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Page 3',
              body: 'Page 3 - Onboarding Page Slide',
              image: buildImage('assets/onboard/onboard3.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Page 4',
              body: 'Page 4 - Onboarding Page Slide',
              footer: ButtonWidget(
                text: 'Get Started',
                onClicked: () => goToHome(context),
              ),
              image: buildImage('assets/manthumbs.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('Start', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Skip'),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => WelcomePage()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
