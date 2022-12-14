import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_otp_ui/utils/constants.dart';
import 'package:phone_otp_ui/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ScreenUtilInit(
    designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return const MaterialApp(
        initialRoute: splashPage,
        onGenerateRoute: MyRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      );
    },
  ));
}
