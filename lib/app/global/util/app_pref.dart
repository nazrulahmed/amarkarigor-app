import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  final String KEY_TOKEN = "auth_token";
  final String KEY_PHONE = "phone";
  static AppPref? _pref;
  static SharedPreferences? _sharedPreferences;

  AppPref._() {}

  static get instance {
    if (_pref == null) {
      _pref = AppPref._();
      SharedPreferences.getInstance()
          .then((value) => _sharedPreferences = value);
    }
    return _pref;
  }

  void saveToken(token) {
    _sharedPreferences!.setString(KEY_TOKEN, token);
  }

  String? retriveToken() {
    return _sharedPreferences!.getString(KEY_TOKEN) ?? null;
  }

  String? savePhoneNumber(phone) {
    _sharedPreferences!.setString(KEY_PHONE, phone);
  }
  String? retrivePhoneNumber() {
    return _sharedPreferences!.getString(KEY_PHONE) ?? null;
  }
}
