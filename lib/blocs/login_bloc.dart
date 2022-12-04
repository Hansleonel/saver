import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:saver/blocs/provider/bloc.dart';
import 'package:saver/models/storage/login_user.dart';
import 'package:saver/usecases/login_use_case.dart';

@injectable
class LoginBloc extends Bloc {
  final LoginUseCase _loginUseCase;

  final _loginStreamController = StreamController<bool>.broadcast();

  final _isIconActiveSubject = BehaviorSubject<bool>.seeded(false);
  bool _loginError = false;

  LoginBloc(this._loginUseCase);

  Function(bool) get loginSink => _loginStreamController.sink.add;
  Stream<bool> get loginStream => _loginStreamController.stream;

  ValueStream<bool> get isIconActive => _isIconActiveSubject.stream;
  set setIsIconActive(bool value) => _isIconActiveSubject.value = value;

  bool get loginError => _loginError;
  set setLoginerror(value) => _loginError = value;

  Future<bool> login(String user, String password) async {
    /*print('2 bloc rellena con false y espera');
    loginSink(false);
    Future.delayed(const Duration(seconds: 3), () {
      print('3 bloc rellana con true luego de esperar');
      loginSink(true);
    });*/
    print('2 bloc rellena con false y espera');
    loginSink(false);

    LoginUser loginUser = await getLoginUser(user);
    print(loginUser.rememberMe);

    if (loginUser.password == password && loginUser.user != '') {
      print('3 bloc rellana con true luego de esperar');
      _loginError = false;
      loginSink(true);
      return true;
    }
    print('sink');
    _loginError = true;
    loginSink(true);

    return false;
  }

  Future<LoginUser> getLoginUser(String user) async {
    LoginUser? loginUser = await _loginUseCase.getLoginUser(user);

    if (loginUser == null) {
      LoginUser loginUserEmpty = LoginUser('', '', '', false);
      return loginUserEmpty;
    }

    return loginUser;
  }

  Future save(LoginUser loginUser) async {
    return _loginUseCase.save(loginUser);
  }

  void disposeStream() {
    _loginStreamController.close();
  }

  @override
  void dispose() {
    _loginStreamController.close();
  }
}
