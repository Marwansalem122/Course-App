import 'package:shared_preferences/shared_preferences.dart';

import '../values/constant.dart';

class StorageServices {
  late final SharedPreferences _prefs;
  Future<StorageServices> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USEE_TOKEN_KEY) == null
        ? false
        : true;
  }
  
}
