import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:saver/blocs/provider/bloc.dart';
import 'package:saver/models/storage/login_user.dart';
import 'package:saver/models/storage/plan_user.dart';
import 'package:saver/usecases/login_use_case.dart';
import 'package:saver/usecases/plan_use_case.dart';

@injectable
class RegisterBloc extends Bloc {
  final LoginUseCase _loginUseCase;
  final PlanUseCase _planUseCase;
  final _hasValidUserNameController = BehaviorSubject<bool>();
  final _hasCompleteDataController = BehaviorSubject<bool>();
  final _hasTheSamePasswordController = BehaviorSubject<bool>();
  final _isIconActivePasswordSubject = BehaviorSubject<bool>.seeded(false);
  final _isIconActiveRepeatPasswordSubject =
      BehaviorSubject<bool>.seeded(false);
  final _registerStreamController = StreamController<bool>.broadcast();

  RegisterBloc(this._loginUseCase, this._planUseCase);

  Function(bool) get registerSink => _registerStreamController.sink.add;
  Stream<bool> get registerStream => _registerStreamController.stream;

  ValueStream<bool> get hasValidUserName => _hasValidUserNameController.stream;
  set setHasValidUserName(bool value) =>
      _hasValidUserNameController.value = value;
  ValueStream<bool> get hasCompleteData => _hasCompleteDataController.stream;
  set setHasCompleteData(bool value) =>
      _hasCompleteDataController.value = value;
  ValueStream<bool> get hasTheSamePassword =>
      _hasTheSamePasswordController.stream;
  set setHasSamePassword(bool value) =>
      _hasTheSamePasswordController.value = value;
  ValueStream<bool> get isIconActivePassword =>
      _isIconActivePasswordSubject.stream;
  set setIsIconActivePassword(bool value) =>
      _isIconActivePasswordSubject.value = value;
  ValueStream<bool> get isIconActiveRepeatPassword =>
      _isIconActiveRepeatPasswordSubject.stream;
  set setIsIconActiveRepeatPassword(bool value) =>
      _isIconActiveRepeatPasswordSubject.value = value;

  Future saveUserData(LoginUser loginUser, PlanUser planUser) async {
    bool isValidUserName = false;
    registerSink(false);
    try {
      isValidUserName = await _loginUseCase.validationUserName(loginUser.user!);
      if (isValidUserName) {
        _hasValidUserNameController.value = true;
        await _loginUseCase.save(loginUser);
        if (planUser.dayToSave! > 0) {
          print('saving plan user');
          await _planUseCase.savePlanUser(planUser);
        }
      } else {
        _hasValidUserNameController.value = false;
      }
      registerSink(true);
    } catch (e, s) {
      _registerStreamController.addError(e);
    }
  }

  // Future<LoginUser> getLoginUser(String user) async {
  //   LoginUser loginUser = await _loginUseCase.getLoginUser(user);
  //   print(loginUser.mail);
  //   return loginUser;
  // }

  @override
  void dispose() {
    _registerStreamController.close();
    _hasValidUserNameController.close();
    _hasCompleteDataController.close();
    _hasTheSamePasswordController.close();
    _isIconActivePasswordSubject.close();
    _isIconActiveRepeatPasswordSubject.close();
  }
}
