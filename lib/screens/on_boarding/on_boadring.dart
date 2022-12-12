import 'package:flutter/material.dart';
import 'package:phone_otp_ui/screens/on_boarding/widgets/intro_page1.dart';
import 'package:phone_otp_ui/screens/on_boarding/widgets/intro_page2.dart';
import 'package:phone_otp_ui/screens/on_boarding/widgets/intro_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/color.dart';
import '../../utils/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //controller to keep track what page we are on
  final PageController _controller = PageController();

  //keep track of if we are last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntorPage1(),
              IntorPage2(),
              IntorPage3(),
            ],
          ),
          //3 dot indicator
          Container(
            alignment: const Alignment(0, 0.70),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                  activeDotColor: AppColors.defaultKarrot,
                  dotColor: AppColors.grey),
            ),
          ),

          // Skip button, onTab will send last intro page
          Positioned(
              top: 720,
              left: 20,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Container(
                      width: 165,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: AppColors.defaultKarrot),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 17),
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    child: onLastPage
                        ? GestureDetector(
                            onTap: () async {
                              Navigator.pushReplacementNamed(context, otp);
                            },
                            child: Container(
                              width: 165,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppColors.defaultKarrot),
                              child: const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        // Next buttons to send next page
                        : GestureDetector(
                            onTap: () async {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              width: 165,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppColors.defaultKarrot),
                              child: const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
