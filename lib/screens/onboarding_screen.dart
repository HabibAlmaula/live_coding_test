import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:live_coding_test/button_widget.dart';
import 'package:live_coding_test/screens/input_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  bool isDone = false;

  List<PageViewModel> pages = [
    PageViewModel(
      title: 'Let\'s meet our summer coffer drinks',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      image: Center(
        child: Image.asset(
          'assets/images/coffee-cup.png',
          width: 200,
          height: 200,
        ),
      ),
      decoration: PageDecoration(
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    ),
    PageViewModel(
      title: 'Let\'s meet our summer coffer drinks',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      image: Center(
        child: Image.asset(
          'assets/images/coffee-cup.png',
          width: 200,
          height: 200,
        ),
      ),
    ),
    PageViewModel(
      title: 'Let\'s meet our summer coffer drinks',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      image: Center(
        child: Image.asset(
          'assets/images/coffee-cup.png',
          width: 200,
          height: 200,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: IntroductionScreen(
              key: _introKey,
              pages: pages,
              done: const Text('Done'),
              next: const Text('Next'),
              skip: const Text('Skip'),
              showSkipButton: false,
              showDoneButton: false,
              showNextButton: false,
              onDone: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InputScreen())),
            ),
          ),
          ButtonWidget(
            text: isDone ? 'Get Started' : 'Next',
            onTap: () {
              Future.delayed(const Duration(milliseconds: 500), () {
                if (_introKey.currentState?.getCurrentPage() != 1) {
                  _introKey.currentState?.next();
                }
                setState(() {
                  isDone = _introKey.currentState?.getCurrentPage() == 1;
                });
                if (isDone) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InputScreen()));
                }
              });
            },
          )
        ],
      ),
    );
  }
}
