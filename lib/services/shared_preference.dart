import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future createCache(String password) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("password", password);
  }

  Future readCache(String password) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.getString("password");
  }

  Future removeCache(String password) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.remove("password");
    return cache;
  }
}
