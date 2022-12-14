import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_otp_ui/utils/icon.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key, required this.navigation});
  final String navigation;

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  Future<void> _init() async {
    await Future.delayed(
      const Duration(milliseconds: 1800),
    );
    Navigator.pushReplacementNamed(context, widget.navigation);
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Lottie.asset(AppIcon.done),
      )),
    );
  }
}
