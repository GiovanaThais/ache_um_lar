import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_KEYS {
  NAME_REGISTRATER_DATA_KEY,
  BIRTHDATE_REGISTRATER_DATA_KEY,
  CELLPHONE_REGISTRATER_DATA_KEY,
  NUMBERID_REGISTRATER_DATA_KEY,
  EMAIL_REGISTRATER_DATA_KEY,
  PASSWORD_REGISTRATER_DATA_KEY,
  PUSH_NOTIFICATION_KEY,
  DARK_THEME_KEY
}

class AppStorageService {
  _setString(String key, String value) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(key, value);
  }

  Future<String> _getString(String key) async {
    final storage = await SharedPreferences.getInstance();
    return storage.getString(key) ?? "";
  }

  Future<void> _setBool(String key, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(key, value);
  }

  Future<bool> _getBool(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(key) ?? false;
  }

  //name
  Future<void> setRegisterDataName(String name) async {
    await _setString(STORAGE_KEYS.NAME_REGISTRATER_DATA_KEY.toString(), name);
  }

  Future<String> getRegisterDataName() async {
    return _getString(STORAGE_KEYS.NAME_REGISTRATER_DATA_KEY.toString());
  }

  //birthday
  Future<void> setRegisterBirthday(String date) async {
    await _setString(STORAGE_KEYS.BIRTHDATE_REGISTRATER_DATA_KEY.toString(),
        date.toString());
  }

  Future<String> getRegisterBirthday() async {
    return _getString(STORAGE_KEYS.BIRTHDATE_REGISTRATER_DATA_KEY.toString());
  }

  //cellphone
  Future<void> setRegisterCellphone(String cell) async {
    await _setString(STORAGE_KEYS.CELLPHONE_REGISTRATER_DATA_KEY.toString(),
        cell.toString());
  }

  Future<String> getRegisterCellphone() async {
    return _getString(STORAGE_KEYS.CELLPHONE_REGISTRATER_DATA_KEY.toString());
  }

  //number id
  Future<void> setRegisterNumberId(String number) async {
    await _setString(STORAGE_KEYS.NUMBERID_REGISTRATER_DATA_KEY.toString(),
        number.toString());
  }

  Future<String> getRegisterNumberId() async {
    return _getString(STORAGE_KEYS.NUMBERID_REGISTRATER_DATA_KEY.toString());
  }

  //email
  Future<void> setRegisterEmail(String email) async {
    await _setString(
        STORAGE_KEYS.EMAIL_REGISTRATER_DATA_KEY.toString(), email.toString());
  }

  Future<String> getRegisterEmail() async {
    return _getString(STORAGE_KEYS.EMAIL_REGISTRATER_DATA_KEY.toString());
  }

  //password
  Future<void> setRegisterPassword(String password) async {
    await _setString(STORAGE_KEYS.PASSWORD_REGISTRATER_DATA_KEY.toString(),
        password.toString());
  }

  Future<String> getRegisterPassword() async {
    return _getString(STORAGE_KEYS.PASSWORD_REGISTRATER_DATA_KEY.toString());
  }

  //push notifier
  Future<void> setSettingsPushNotifier(bool value) async {
    await _setBool(STORAGE_KEYS.PUSH_NOTIFICATION_KEY.toString(), value);
  }

  Future<bool> getSettingsPushNotifier() async {
    return _getBool(STORAGE_KEYS.PUSH_NOTIFICATION_KEY.toString());
  }

  //dark theme

  Future<void> setSettingsDarkTheme(bool value) async {
    await _setBool(STORAGE_KEYS.DARK_THEME_KEY.toString(), value);
  }

  Future<bool> getSettingsDarkTheme() async {
    return _getBool(STORAGE_KEYS.DARK_THEME_KEY.toString());
  }
}
