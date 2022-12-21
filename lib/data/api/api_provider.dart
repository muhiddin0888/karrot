import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:http/http.dart' as https;

class ApiProvider {
  Future<String> getUserToken(
      {required String phoneNumber, required String fcmToken}) async {
    try {
      Response response = await https.post(
          Uri.parse("http://192.168.0.111:8000/api/user"),
          body: {"phone_number": phoneNumber, "fcm_token": fcmToken});
      if (response.statusCode == 200) {
        log("Access Token: ${jsonDecode(response.body)["access_token"]}");
        return jsonDecode(response.body)["access_token"];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getUserInfo({required String accessToken}) async {
    try {
      Response response = await https
          .get(Uri.parse("http://192.168.0.111:8000/api/user"), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });
      if (response.statusCode == 200) {
        print('Token : ${accessToken}');
        print('ERROR FOR SHOW : ${response.body}');
        log(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
