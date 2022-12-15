import 'package:flutter/material.dart';
import 'package:phone_otp_ui/utils/color.dart';
import '../data/local_data/storage.dart';
import '../utils/constants.dart';
import '../utils/icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _init() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    await StorageRepository.getInstance();
    var isLogged = StorageRepository.getBool("isLogged");
    print(isLogged);
    if (!mounted) return;
    if (isLogged) {
      Navigator.pushReplacementNamed(context, navBar);
    } else {
      Navigator.pushReplacementNamed(context, onBoarding);
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(child: Image.asset(AppIcon.splash)),
    );
  }
}
