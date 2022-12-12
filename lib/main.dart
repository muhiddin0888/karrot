import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_ui/utils/constants.dart';
import 'package:phone_otp_ui/router.dart';
import 'package:phone_otp_ui/task1/phone.dart';
import 'package:phone_otp_ui/task1/verify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: splashPage,
    onGenerateRoute: MyRouter.generateRoute,
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => const MyPhone(),
      'verify': (context) => const MyVerify()
    },
  ));
}
