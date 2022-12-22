import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_otp_ui/screens/on_boarding/widgets/intro_page1.dart';
import 'package:phone_otp_ui/screens/on_boarding/widgets/intro_page2.dart';
import 'package:phone_otp_ui/screens/on_boarding/widgets/intro_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/color.dart';
import '../../utils/router_constants.dart';

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
          //Main Page Viewer
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              // 3  main inrtoduction pages
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
              effect: const WormEffect(
                  activeDotColor: AppColors.defaultKarrot,
                  dotColor: Color.fromARGB(255, 247, 192, 155)),
            ),
          ),

          // Skip button, onTab will send last intro page
          Positioned(
            top: MediaQuery.of(context).size.height * 0.9,
            left: MediaQuery.of(context).size.height * 0.03,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Container(
                    width: 145.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.defaultKarrot),
                    child: Center(
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                SizedBox(
                  child: onLastPage
                      ? GestureDetector(
                          onTap: () async {
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                RouterConstants.otp,
                                (Route<dynamic> route) => false);
                          },
                          child: Container(
                            width: 145.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.defaultKarrot),
                            child: Center(
                              child: Text(
                                "Done",
                                style: TextStyle(
                                    fontSize: 18.sp,
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
                            width: 145.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.defaultKarrot),
                            child: Center(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
          // Next and Done buttons to send next page
        ],
      ),
    );
  }
}
