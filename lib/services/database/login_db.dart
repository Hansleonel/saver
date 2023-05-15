import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:saver/models/storage/login_user.dart';

const String LOGIN_BOX = "loginBox";
const String USER_NAME_BOX = "userNameBox";
const String LOGIN_USER_NAME_SAVED = "userNameKey";
//const String

mixin LoginDB {
  Future saveUser(LoginUser loginUser);
  Future<LoginUser?> getLoginUser(String user);
  Future<List<LoginUser>> getAllUsers();
  Future<bool> saveLoginUserName(String userName);
  Future<String> getLoginUserName();
}

@Injectable(as: LoginDB)
class LoginDBAdapter implements LoginDB {
  Future<Box> _openBox(String nameBox) async {
    try {
      final box = await Hive.openBox(nameBox);
      return box;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future saveUser(LoginUser loginUser) async {
    try {
      final box = await _openBox(LOGIN_BOX);
      await box.put(loginUser.user, loginUser);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginUser?> getLoginUser(String user) async {
    try {
      final box = await _openBox(LOGIN_BOX);
      LoginUser? loginUser = box.get(user);
      return loginUser;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<LoginUser>> getAllUsers() async {
    List<LoginUser> userList = [];
    try {
      final box = await _openBox(LOGIN_BOX);
      userList = box.values.toList().cast<LoginUser>();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
    return userList;
  }

  @override
  Future<bool> saveLoginUserName(String userName) async {
    try {
      final box = await _openBox(USER_NAME_BOX);

      await box.put(LOGIN_USER_NAME_SAVED, userName);
      return true;
    } catch (e) {
      log(e.toString(), name: 'SaveLoginUserName');
      rethrow;
    }
  }

  @override
  Future<String> getLoginUserName() async {
    try {
      final box = await _openBox(USER_NAME_BOX);
      String? result = await box.get(LOGIN_USER_NAME_SAVED);
      return result ?? '';
    } catch (e) {
      log(e.toString(), name: 'GetLoginUserName');
      rethrow;
    }
  }
}
