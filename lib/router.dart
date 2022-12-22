import 'package:flutter/material.dart';
import 'package:phone_otp_ui/screens/chat/chat_home_page.dart';
import 'package:phone_otp_ui/screens/delivery/crate_post/create_post.dart';
import 'package:phone_otp_ui/screens/delivery/widgets/delivery_post_info.dart';
import 'package:phone_otp_ui/screens/nav_bar.dart';
import 'package:phone_otp_ui/screens/notification/notification_screen.dart';
import 'package:phone_otp_ui/screens/on_boarding/on_boadring.dart';
import 'package:phone_otp_ui/screens/profile/profile_edit_screen.dart';
import 'package:phone_otp_ui/screens/splash_scree.dart';
import 'package:phone_otp_ui/screens/login/phone.dart';
import 'package:phone_otp_ui/screens/login/verify.dart';
import 'package:phone_otp_ui/utils/router_constants.dart';

class MyRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.splashPage:
        return navigateTo(const SplashScreen());
      case RouterConstants.onBoarding:
        return navigateTo(const OnBoardingScreen());
      case RouterConstants.navBar:
        return navigateTo(const TabBox());
      case RouterConstants.otp:
        return navigateTo(const MyPhone());
      case RouterConstants.verify:
        return navigateTo(const MyVerify());
      case RouterConstants.notification:
        return navigateTo(const NotificationScreen());
      case RouterConstants.deliverInfo:
        return navigateTo(const DeliveryPostInfo());
      case RouterConstants.chat:
        return navigateTo(const ChatHomePage());
      case RouterConstants.createPost:
        return navigateTo(const CreatePostScreen());
      case RouterConstants.profileEditScreen:
        return navigateTo(const ProfileEditScreen());
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
