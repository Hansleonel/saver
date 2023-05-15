import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:saver/blocs/provider/bloc.dart';
import 'package:saver/models/storage/plan_user.dart';
import 'package:saver/usecases/login_use_case.dart';
import 'package:saver/usecases/plan_use_case.dart';

@injectable
class PlanBloc extends Bloc {
  final PlanUseCase _planUseCase;
  final LoginUseCase _loginUseCase;
  final _planSelectedSubject = BehaviorSubject<int>();
  final _itemSelectedPositionSubject = BehaviorSubject<int>();
  final _errorPlanSelectedSubject = BehaviorSubject<bool>();
  final _errorItemSelectedSubject = BehaviorSubject<bool>();
  final _hasPlanCalculate = BehaviorSubject<bool>();
  final _isEnableButton = BehaviorSubject<bool>();
  final _daysToSaveSubect = BehaviorSubject<int>();

  int _daysToSave = 0;
  int _mountSaved = 0;

  PlanBloc(this._planUseCase, this._loginUseCase);

  ValueStream<int> get planSelected => _planSelectedSubject.stream;
  ValueStream<int> get itemSelected => _itemSelectedPositionSubject.stream;
  ValueStream<bool> get errorPlanSelected => _errorPlanSelectedSubject.stream;
  ValueStream<bool> get errorItemSelected => _errorItemSelectedSubject.stream;
  ValueStream<bool> get hasPlanCalculate => _hasPlanCalculate.stream;
  ValueStream<bool> get isEnableButton => _isEnableButton.stream;
  ValueStream<int> get getDayToSave => _daysToSaveSubect.stream;

  int get dayToSave => _daysToSave;
  int get mountSaved => _mountSaved;

  set setPlanSelected(int value) => _planSelectedSubject.value = value;
  set setItemSelected(int value) => _itemSelectedPositionSubject.value = value;
  set setErrorPlanSelected(bool value) =>
      _errorPlanSelectedSubject.value = value;
  set setErrorItemSelected(bool value) =>
      _errorItemSelectedSubject.value = value;
  set setHasPlanCalculate(bool value) => _hasPlanCalculate.value = value;
  set setIsEnableButton(bool value) => _isEnableButton.value = value;
  set setDayToSave(int value) => _daysToSave = value;
  set setMountSaved(int value) => _mountSaved = value;

  Future<int> calculatePlanDays(int mount) async {
    _hasPlanCalculate.value = false;
    // TODO refactor with time of the service
    await Future.delayed(const Duration(seconds: 2));
    // TODO REFACTOR THIS
    int maxDaysRounded;
    if (mount > 0) {
      double maxDaysDouble = sqrt(mount * 2);

      if (maxDaysDouble <= maxDaysDouble.round()) {
        maxDaysRounded = maxDaysDouble.round();
      } else {
        maxDaysRounded = maxDaysDouble.round() + 1;
      }
      _daysToSave = maxDaysRounded;
      _mountSaved = ((_daysToSave * (_daysToSave + 1)) / 2).round();

      _hasPlanCalculate.value = true;
      _isEnableButton.value = true;
    } else {
      // _hasPlanCalculate.value = false;
      _daysToSave = 0;
      _mountSaved = 0;
      maxDaysRounded = 0;
      _isEnableButton.value = false;
    }
    return maxDaysRounded;
  }

  Future<int> getPlanUser() async {
    try {
      String userName = await _loginUseCase.getLoginUserName();
      print('el nombre del usuario es $userName');
      PlanUser planUser = await _planUseCase.getPlanUser(userName);
      if (planUser.dayToSave != null && planUser.dayToSave! > 0) {
        _daysToSaveSubect.value = planUser.dayToSave!;
        return planUser.dayToSave!;
      }
      _daysToSaveSubect.value = 0;
      return 0;
    } catch (e, s) {
      return 0;
    }
  }

  @override
  void dispose() {
    _planSelectedSubject.close();
    _itemSelectedPositionSubject.close();
    _isEnableButton.close();
    _errorPlanSelectedSubject.close();
    _errorItemSelectedSubject.close();
    _hasPlanCalculate.close();
  }
}
