import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_KEYS {
  NAME_COMPANY_REGISTRATER_DATA_KEY,
  NUMBERID_COMPANY_REGISTRATER_DATA_KEY,
  CNPJ_COMPANY_REGISTRATER_DATA_KEY,
  CELLPHONE_COMPANY_REGISTRATER_DATA_KEY,
  CRECI_REGISTRATER_DATA_KEY,
  EMAIL_COMPANY_REGISTRATER_DATA_KEY,
  PASSWORD_COMPANY_REGISTRATER_DATA_KEY,
  PUSH_NOTIFICATION_KEY,
  DARK_THEME_KEY
}

class AppStorageCompanyService {
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
  Future<void> setRegisterCompanyDataName(String name) async {
    await _setString(
        STORAGE_KEYS.NAME_COMPANY_REGISTRATER_DATA_KEY.toString(), name);
  }

  Future<String> getRegisterCompanyDataName() async {
    return _getString(
        STORAGE_KEYS.NAME_COMPANY_REGISTRATER_DATA_KEY.toString());
  }

  //cellphone
  Future<void> setRegisterCompanyCellphone(String cell) async {
    await _setString(
        STORAGE_KEYS.CELLPHONE_COMPANY_REGISTRATER_DATA_KEY.toString(),
        cell.toString());
  }

  Future<String> getRegisterCompanyCellphone() async {
    return _getString(
        STORAGE_KEYS.CELLPHONE_COMPANY_REGISTRATER_DATA_KEY.toString());
  }

  //number id
  Future<void> setRegisterCompanyNumberId(String number) async {
    await _setString(
        STORAGE_KEYS.NUMBERID_COMPANY_REGISTRATER_DATA_KEY.toString(),
        number.toString());
  }

  Future<String> getRegisterCompanyNumberId() async {
    return _getString(
        STORAGE_KEYS.NUMBERID_COMPANY_REGISTRATER_DATA_KEY.toString());
  }

  //CRECI
  Future<void> setRegisterCreci(String number) async {
    await _setString(
        STORAGE_KEYS.CRECI_REGISTRATER_DATA_KEY.toString(), number.toString());
  }

  Future<String> getRegisterCreci() async {
    return _getString(STORAGE_KEYS.CRECI_REGISTRATER_DATA_KEY.toString());
  }

  //Cnpj
  Future<void> setRegisterCnpj(String number) async {
    await _setString(STORAGE_KEYS.CNPJ_COMPANY_REGISTRATER_DATA_KEY.toString(),
        number.toString());
  }

  Future<String> getRegisterCnpj() async {
    return _getString(
        STORAGE_KEYS.CNPJ_COMPANY_REGISTRATER_DATA_KEY.toString());
  }

  //email
  Future<void> setRegisterCompanyEmail(String email) async {
    await _setString(STORAGE_KEYS.EMAIL_COMPANY_REGISTRATER_DATA_KEY.toString(),
        email.toString());
  }

  Future<String> getRegisterCompanyEmail() async {
    return _getString(
        STORAGE_KEYS.EMAIL_COMPANY_REGISTRATER_DATA_KEY.toString());
  }

  //password
  Future<void> setRegisterCompanyPassword(String password) async {
    await _setString(
        STORAGE_KEYS.PASSWORD_COMPANY_REGISTRATER_DATA_KEY.toString(),
        password.toString());
  }

  Future<String> getRegisterCompanyPassword() async {
    return _getString(
        STORAGE_KEYS.PASSWORD_COMPANY_REGISTRATER_DATA_KEY.toString());
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
