import 'package:injectable/injectable.dart';
import 'package:saver/models/storage/login_user.dart';
import 'package:saver/services/database/login_db.dart';

mixin LoginRepository {
  Future save(LoginUser loginUser);
  Future<LoginUser?> getLoginUser(String user);
  Future<List<LoginUser>> getAllUsers();
}

@Injectable(as: LoginRepository)
class LoginRepositoryAdapter implements LoginRepository {
  final LoginDB loginDB;

  LoginRepositoryAdapter(this.loginDB);

  @override
  Future save(LoginUser loginUser) {
    return loginDB.saveUser(loginUser);
  }

  @override
  Future<LoginUser?> getLoginUser(String user) {
    return loginDB.getLoginUser(user);
  }

  @override
  Future<List<LoginUser>> getAllUsers() {
    return loginDB.getAllUsers();
  }
}
