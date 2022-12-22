import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_ui/screens/login/phone.dart';
import '../../utils/router_constants.dart';
import '../api/api_provider.dart';
import '../local_data/storage.dart';
import '../models/chat_mode/chats_model.dart';
import '../models/chat_mode/user_item.dart';

class HelperRepository {
  HelperRepository({
    required FirebaseFirestore fireStore,
    required this.apiProvider,
  }) : _fireStore = fireStore;

  final FirebaseFirestore _fireStore;
  final ApiProvider apiProvider;

  Future<void> postUser({
    required Map<String, dynamic> userJson,
  }) async {
    try {
      _fireStore
          .collection("users")
          .where("phone_number", isEqualTo: userJson["phone_number"])
          .get()
          .then((value) {
        if (value.size > 0) {
          log('Document exists on the database');
        } else {
          _fireStore.collection("users").add(userJson);
          log("User added, $userJson");
        }
      });
      // _fireStore
      //     .collection('users')
      //     .doc(userJson["phone_number"])
      //     .get()
      //     .then((DocumentSnapshot documentSnapshot) {
      //   if (documentSnapshot.exists) {
      //
      //   } else {

      //   }
      // });
    } catch (e) {
      throw Exception();
    }
  }

  Stream<List<UserItem>> getUsers() =>
      _fireStore.collection('users').snapshots().map(
        (snapshot) {
          debugPrint(
              "Users:  ${snapshot.docs.map((doc) => UserItem.fromJson(doc.data())).toList()}");
          return snapshot.docs
              .map((doc) => UserItem.fromJson(doc.data()))
              .toList();
        },
      );

  Future<UserItem> getUsersById({required String docId}) async {
    var data = await _fireStore.collection('users').doc(docId).get();
    UserItem userItem = UserItem.fromJson(data.data() as Map<String, dynamic>);
    return userItem;
  }

// -------------------------------------SIGN IN WITH PHONE NUMBER---------------------------------------------------------------------

  Future<void> singInWithPhoneNumber(
      {required String number, required BuildContext context}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        debugPrint('VERIFICATION FAILED: $e ');
      },
      codeSent: (String verificationId, int? resendToken) {
        debugPrint('VERIFICATION ID: $verificationId');
        MyPhone.verify = verificationId;
        Navigator.pushNamed(context, RouterConstants.otp);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> otpVerification(
      {required String code, required BuildContext context}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: MyPhone.verify,
        smsCode: code,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      await StorageRepository.putBool("isValid", true);
      Navigator.pushNamedAndRemoveUntil(
          context, RouterConstants.navBar, (route) => false);
    } on FirebaseAuthException catch (e) {
      debugPrint("wrong otp: ${e.message}");
    }
  }

  //-------------------------------------CHATS----------------------------------------------------

  Stream<List<ChatsModel>> getTwoUsersConversation() => _fireStore
      .collection('chats')
      .orderBy("creat_at")
      .
      // .where("sender_id", isEqualTo: senderId)
      // .where("receiver_id", isEqualTo: receiverId).
      snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map((doc) => ChatsModel.fromJson(doc.data()))
            .toList(),
      );

  Future<void> postChat({
    required Map<String, dynamic> chatJson,
  }) async {
    try {
      var newChat = await _fireStore.collection("chats").add(chatJson);
      await _fireStore
          .collection("chats")
          .doc(newChat.id)
          .update({"chat_id": newChat.id});
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> updateChat(
      {required ChatsModel chatsModel, required String docId}) async {
    try {
      await _fireStore
          .collection("chats")
          .doc(docId)
          .update(chatsModel.toJson());
    } catch (e) {
      throw Exception();
    }
  }

  Stream<List<ChatsModel>> getChats() => _fireStore
      .collection('chats')
      .where("receiver_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map((doc) => ChatsModel.fromJson(doc.data()))
            .toList(),
      );
//--------------------------------------CHAT------------------------------------------------
//--------------------------------------Api------------------------------------------------
  Future<String> getUserToken(
          {required String phoneNumber, required String fcmToken}) =>
      apiProvider.getUserToken(phoneNumber: phoneNumber, fcmToken: fcmToken);
  Future<String> getUserInfo({required String accessToken}) =>
      apiProvider.getUserInfo(accessToken: accessToken);
}
