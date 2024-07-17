import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:votev/dashboard.dart';
import 'package:votev/signup.dart';
import 'screens/screen1.dart';
import 'screens/screen2.dart';
import 'screens/screen3.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void dispose() {
    super.dispose();
  }

  PageController pageController = PageController();
  String buttonText = "skip";
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    navigatorKey:
    navigatorKey;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Dashboard();
              }
              return Stack(
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      currentPageIndex = index;
                      if (index == 2) {
                        buttonText = 'Done';
                      } else {
                        buttonText = 'Skip';
                      }
                      setState(() {});
                    },
                    children: const [Screen1(), Screen2(), Screen3()],
                  ),
                  Container(
                      alignment: const Alignment(0, 0.8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()),
                                );
                              },
                              child: Text(
                                '$buttonText',
                                style: const TextStyle(color: Colors.white),
                              )),
                          SmoothPageIndicator(
                              controller: pageController,
                              count: 3,
                              effect: const WormEffect(
                                  dotWidth: 8,
                                  dotHeight: 8,
                                  dotColor: Color.fromARGB(255, 221, 221, 221),
                                  activeDotColor:
                                      Color.fromARGB(255, 0, 218, 7))),
                          currentPageIndex == 2
                              ? const SizedBox(
                                  width: 10,
                                )
                              : GestureDetector(
                                  onTap: () {
                                    pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                  },
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ))
                        ],
                      ))
                ],
              );
            }));
  }
}
