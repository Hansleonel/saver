import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:saver/blocs/provider/bloc.dart';

@injectable
class PlanBloc extends Bloc {
  final _planSelectedSubject = BehaviorSubject<int>();
  final _itemSelectedPositionSubject = BehaviorSubject<int>();
  final _errorPlanSelectedSubject = BehaviorSubject<bool>();
  final _errorItemSelectedSubject = BehaviorSubject<bool>();
  final _hasPlanCalculate = BehaviorSubject<bool>();
  final _isEnableButton = BehaviorSubject<bool>();
  int _daysToSave = 0;
  int _mountSaved = 0;

  ValueStream<int> get planSelected => _planSelectedSubject.stream;
  ValueStream<int> get itemSelected => _itemSelectedPositionSubject.stream;
  ValueStream<bool> get errorPlanSelected => _errorPlanSelectedSubject.stream;
  ValueStream<bool> get errorItemSelected => _errorItemSelectedSubject.stream;
  ValueStream<bool> get hasPlanCalculate => _hasPlanCalculate.stream;
  ValueStream<bool> get isEnableButton => _isEnableButton.stream;
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

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
