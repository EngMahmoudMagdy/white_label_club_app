// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = 'M3aarf';
  // static const double APP_VERSION = 11;
  //static const String BASE_URL = 'http://192.168.1.6:8000';
  //static const String BASE_URL = 'http://10.0.2.2:8000';
  static const String BASE_URL = 'https://www.m3aarf.com/';

  // Shared Key
  static const String TOKEN = 'token';
  static const String REMEMBER_ME = 'remember_me';
  static const String TOPIC = 'm3aarf';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_EMAIL = 'user_email';
  static const String SELECTED_CATEGORIES = 'selected_categories';

  // REGX
  // ignore: non_constant_identifier_names
  static RegExp EMAIL_REG_EXP = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
}
