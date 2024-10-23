import 'package:hive_flutter/hive_flutter.dart';

import '../utils/app_const.dart';

class MainHiveBox {
  Future<void> init() async {
    await Hive.openBox(AppConst.mainBoxName);
  }

  static Box mainBox = Hive.box(AppConst.mainBoxName);

  // put data in hive ====>>>
  static Future<void> putValue(String key, dynamic value) async {
    await mainBox.put(key, value);
  }

  // get data from hive ====>>>
  static Future<dynamic> getValue(String key) async {
    return await mainBox.get(key);
  }

  // user id ====>>>
  static Future<num?> getUserId() async {
    return await mainBox.get(AppConst.userIdBox) ?? 0;
  }

  static Future<void> deleteUserId() async {
    await mainBox.delete(AppConst.userIdBox);
  }

  // token ====>>>
  static Future<String?> getToken() async {
    return await mainBox.get(AppConst.tokenBox);
  }

  static Future<void> deleteToken() async {
    await mainBox.delete(AppConst.tokenBox);
  }

  // get isDark ====>>>
  // if isDark is null, return false (light mode) if not, return isDark
  static Future<bool> getIsDark() async {
    return await mainBox.get(AppConst.isDarkBox) ?? false;
  }

  // check if intro is seen ====>>>
  // if intro is seen, return false
  static Future<bool> getIsIntroSeen() async {
    return await mainBox.get(AppConst.introFinishBox) ?? false;
  }

  // check if user is logged in ====>>>
  // if token is null, that means user is not logged in
  static Future<bool> getIsLoggedIn() async {
    final isTokenNull = await mainBox.get(AppConst.tokenBox);
    if (isTokenNull == null) {
      return false;
    } else {
      return true;
    }
  }
}
