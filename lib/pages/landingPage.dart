import 'package:clearapp/pages/basicList.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image(
          image: AssetImage('assets/images/intro2.png'),
        ),
        title: "Intro Screen 1",
        body:
            "Sort items by priority. Important items are highlighted at the top.",
        footer: Text("Clear App"),
      ),
      PageViewModel(
        image: Image(
          image: AssetImage('assets/images/intro2.png'),
        ),
        title: "Intro Screen 2",
        body: "Top and hold to pick an item and reprioritize.",
        footer: Text("Clear App"),
      ),
      PageViewModel(
        image: Image(
          image: AssetImage('assets/images/intro3.png'),
        ),
        title: "Intro Screen 3",
        body:
            "Swipe left or right to marks a task complete or delete that task.",
        footer: Text("Clear App"),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
          pages: getPages(),
          onDone: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => new BaiscList(),
                ));
          },
          done: Text(
            "Done",
            style: TextStyle(color: Colors.black),
          ),
          showNextButton: true,
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(color: Colors.black),
          ),
          onSkip: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => new BaiscList(),
                ));
          },
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)))),
    );
  }
}
