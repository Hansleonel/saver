import 'package:injectable/injectable.dart';
import 'package:saver/models/storage/login_user.dart';
import 'package:saver/repositories/login_repository.dart';

mixin LoginUseCase {
  Future save(LoginUser loginUser);
  Future<LoginUser?> getLoginUser(String user);
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
}
