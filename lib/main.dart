import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_otp_ui/data/api/api_provider.dart';
import 'package:phone_otp_ui/utils/constants.dart';
import 'package:phone_otp_ui/router.dart';
import 'package:phone_otp_ui/utils/router_constants.dart';

import 'cubits/chats/chats_cubit.dart';
import 'cubits/language_cubit/language_cubit.dart';
import 'cubits/language_cubit/language_state.dart';
import 'cubits/user/user_cubit.dart';
import 'data/repository/helper_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await FirebaseMessaging.instance;

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Constants.uzb,
        Constants.ru,
        Constants.eng,
      ],
      fallbackLocale: Constants.uzb,
      path: "assets/translations",
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => UserCubit(
                  helperRepository: HelperRepository(
                      fireStore: FirebaseFirestore.instance,
                      apiProvider: ApiProvider())),
            ),
            BlocProvider(
              create: (context) => ChatsCubit(
                helperRepository: HelperRepository(
                    fireStore: FirebaseFirestore.instance,
                    apiProvider: ApiProvider()),
              ),
            ),
            BlocProvider<LocalizationCubit>(
              create: (_) => LocalizationCubit(
                  //LocalizationStates.initial(),
                  ),
            ),
          ],
          child: BlocBuilder<LocalizationCubit, LocalizationStates>(
            buildWhen: (perv, curr) => curr is LocalizationChangeState,
            builder: (context, state) {
              Locale? lan;
              if (state is LocalizationChangeState) {
                lan = state.lan;
              }
              return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                initialRoute: RouterConstants.splashPage,
                onGenerateRoute: MyRouter.generateRoute,
                debugShowCheckedModeBanner: false,
              );
            },
          ),
        );
      },
    );
  }
}
