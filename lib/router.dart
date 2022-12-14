import 'package:flutter/material.dart';
import 'package:phone_otp_ui/screens/delivery/widgets/delivery_post_info.dart';
import 'package:phone_otp_ui/screens/nav_bar.dart';
import 'package:phone_otp_ui/screens/notification/notification_screen.dart';
import 'package:phone_otp_ui/screens/on_boarding/on_boadring.dart';
import 'package:phone_otp_ui/screens/splash_scree.dart';
import 'package:phone_otp_ui/utils/constants.dart';
import 'package:phone_otp_ui/screens/login/phone.dart';
import 'package:phone_otp_ui/screens/login/verify.dart';

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
      case notification:
        return navigateTo(const NotificationScreen());
      case deliverInfo:
        return navigateTo(const DeliveryPostInfo());
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
