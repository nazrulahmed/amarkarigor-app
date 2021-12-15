import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  final String KEY_TOKEN = "auth_token";
  final String KEY_PHONE = "phone";
  final String KEY_LOCATION = "location";
  static AppPref? _pref;
  static SharedPreferences? _sharedPreferences;

  AppPref._() {}

  static Future<AppPref?> get instance async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
      _pref = AppPref._();
    }

    return _pref;
    
  }

  void saveToken(token) {
    _sharedPreferences!.setString(KEY_TOKEN, token);
  }

  String? retriveToken() {
    return _sharedPreferences!.getString(KEY_TOKEN) ?? null;
  }

  void savePhoneNumber(String phone) {
    _sharedPreferences!.setString(KEY_PHONE, phone);
  }

  String? retrivePhoneNumber() {
    return _sharedPreferences!.getString(KEY_PHONE) ?? null;
  }

  void setLocation(String location) {
    _sharedPreferences!.setString(KEY_LOCATION, location);
  }

  String? getLocation() {
    return _sharedPreferences!.getString(KEY_LOCATION) ?? null;
  }
}
