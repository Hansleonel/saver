import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:saver/blocs/provider/bloc.dart';
import 'package:saver/models/storage/login_user.dart';
import 'package:saver/usecases/login_use_case.dart';

@injectable
class RegisterBloc extends Bloc {
  final LoginUseCase _loginUseCase;
  final _registerStreamController = StreamController<bool>.broadcast();

  RegisterBloc(this._loginUseCase);

  Function(bool) get registerSink => _registerStreamController.sink.add;
  Stream<bool> get registerStream => _registerStreamController.stream;

  Future save(LoginUser loginUser) async {
    registerSink(false);
    await _loginUseCase.save(loginUser);
    registerSink(true);
  }

  // Future<LoginUser> getLoginUser(String user) async {
  //   LoginUser loginUser = await _loginUseCase.getLoginUser(user);
  //   print(loginUser.mail);
  //   return loginUser;
  // }

  @override
  void dispose() {
    _registerStreamController.close();
  }
}
