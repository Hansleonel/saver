import 'package:injectable/injectable.dart';
import 'package:saver/models/storage/login_user.dart';
import 'package:saver/repositories/login_repository.dart';

mixin LoginUseCase {
  Future save(LoginUser loginUser);
  Future<LoginUser?> getLoginUser(String user);
  Future<bool> validationUserName(String userName);
}

@Injectable(as: LoginUseCase)
class LoginUseCaseAdapter implements LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCaseAdapter(this._loginRepository);

  @override
  Future save(LoginUser loginUser) {
    return _loginRepository.save(loginUser);
  }

  @override
  Future<LoginUser?> getLoginUser(String user) {
    return _loginRepository.getLoginUser(user);
  }

  @override
  Future<bool> validationUserName(String userName) async {
    List<LoginUser> userList = await _loginRepository.getAllUsers();
    for (var user in userList) {
      print('USER ${user.user}');
      if (user.user == userName) {
        return false;
      }
    }
    return true;
  }
}
