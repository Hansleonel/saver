import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:saver/models/storage/login_user.dart';

const String LOGIN_BOX = "loginBox";
//const String

mixin LoginDB {
  Future saveUser(LoginUser loginUser);
  Future<LoginUser?> getLoginUser(String user);
  Future<List<LoginUser>> getAllUsers();
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
}
