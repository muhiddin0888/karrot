import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import '../../data/local_data/storage.dart';
import '../../data/models/chat_mode/user_item.dart';
import '../../data/repository/helper_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.helperRepository})
      : super(const UserState(
          isAdded: false,
          errorText: '',
          status: FormzStatus.pure,
          users: [],
          fields: {
            "phone_number": "",
            "user_auth": "",
            "user_id": "",
            "user_name": "",
          },
        ));

  final HelperRepository helperRepository;
  late StreamSubscription _subscriptionAll;

  Future<void> singInWithPhoneNumber(
      {required String number, required BuildContext context}) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await helperRepository.singInWithPhoneNumber(
          number: number, context: context);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: error.message));
    }
  }

  Future<void> otpVerification(
      {required String code, required BuildContext context}) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await helperRepository.otpVerification(code: code, context: context);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      var uid = FirebaseAuth.instance.currentUser!.uid;
      var phoneNumber = FirebaseAuth.instance.currentUser!.phoneNumber!;
      String? FCMToken = await FirebaseMessaging.instance.getToken();
      await addUser(
        user: UserItem(
            userId: uid,
            phoneNumber: phoneNumber,
            userAuth: '',
            userName: phoneNumber),
      );
      await helperRepository.getUserToken(
          phoneNumber: phoneNumber, fcmToken: FCMToken!);
      String accessToken = await helperRepository.getUserToken(
          phoneNumber: phoneNumber, fcmToken: FCMToken);
      await StorageRepository.putString(
          key: "access_token", value: accessToken);
      log("get number: $phoneNumber");
      log("Added token $accessToken");
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: error.message));
    }
  }

  Future<void> getUserInfo({required String accessToken}) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await helperRepository.getUserInfo(accessToken: accessToken);
      print("Done");
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: error.message));
    }
  }

  Future<void> addUser({required UserItem user}) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await helperRepository.postUser(
        userJson: user.toJson(),
      );
    } catch (error) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: error.toString()));
    }
  }

  Future<void> listenUsers() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    _subscriptionAll = helperRepository.getUsers().listen(
      (users) {
        emit(
          state.copyWith(
            users: users,
            status: FormzStatus.submissionSuccess,
          ),
        );
      },
      onError: (error) {
        emit(state.copyWith(
            errorText: error.toString(),
            status: FormzStatus.submissionFailure));
      },
    );
  }
}
