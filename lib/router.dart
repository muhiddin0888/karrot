import 'package:flutter/material.dart';
import 'package:phone_otp_ui/screens/nav_bar.dart';
import 'package:phone_otp_ui/screens/on_boarding/on_boadring.dart';
import 'package:phone_otp_ui/screens/splash_scree.dart';
import 'package:phone_otp_ui/task2/map.dart';
import 'package:phone_otp_ui/task4/login.dart';
import 'package:phone_otp_ui/utils/constants.dart';
import 'package:phone_otp_ui/home.dart';
import 'package:phone_otp_ui/login/phone.dart';
import 'package:phone_otp_ui/login/verify.dart';

class MyRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return navigateTo(const SplashScreen());
      case onBoarding:
        return navigateTo(const OnBoardingScreen());
      case tabBox:
        return navigateTo(const TabBox());
      case otp:
        return navigateTo(const MyPhone());
      case verify:
        return navigateTo(const MyVerify());
      // case home:
      //   return navigateTo(HomePage());
      // case map:
      //   return navigateTo(const MapPage());
      // case chat:
      //   return navigateTo(const LogIn());
      default:
        return navigateTo(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) => MaterialPageRoute(
      builder: (context) => widget,
    );
