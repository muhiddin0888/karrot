import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_otp_ui/utils/constants.dart';
import 'package:phone_otp_ui/router.dart';

import 'cubits/chats/chats_cubit.dart';
import 'cubits/user/user_cubit.dart';
import 'data/repository/helper_repository.dart';

// const bool USE_EMULATOR = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // if (USE_EMULATOR) {
  //   _connectToFirebaseEmulator();
  // }

  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => UserCubit(
                helperRepository:
                    HelperRepository(fireStore: FirebaseFirestore.instance),
              ),
            ),
            BlocProvider(
              create: (context) => ChatsCubit(
                helperRepository:
                    HelperRepository(fireStore: FirebaseFirestore.instance),
              ),
            ),
          ],
          child: const MaterialApp(
            initialRoute: splashPage,
            onGenerateRoute: MyRouter.generateRoute,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    ),
  );
}

// Future _connectToFirebaseEmulator() async {
//   const fireStorePort = "127.0.0.1:8080 ";
//   const authPort = 9099;
//   const storagePort = 9000;
//   final localHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
//   FirebaseFirestore.instance.settings = Settings(
//       host: "$localHost:$fireStorePort",
//       sslEnabled: false,
//       persistenceEnabled: false);

//   await FirebaseAuth.instance.useAuthEmulator(localHost, authPort);
//   await FirebaseStorage.instance.useStorageEmulator(localHost, storagePort);
// }
