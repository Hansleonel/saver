import 'package:rxdart/rxdart.dart';

class PlanBloc {
  final _planSelectedSubject = BehaviorSubject<int>();
  final _itemSelectedPositionSubject = BehaviorSubject<int>();
  final _errorPlanSelectedSubject = BehaviorSubject<bool>();
  final _errorItemSelectedSubject = BehaviorSubject<bool>();

  ValueStream<int> get planSelected => _planSelectedSubject.stream;
  ValueStream<int> get itemSelected => _itemSelectedPositionSubject.stream;
  ValueStream<bool> get errorPlanSelected => _errorPlanSelectedSubject.stream;
  ValueStream<bool> get errorItemSelected => _errorItemSelectedSubject.stream;

  set setPlanSelected(int value) => _planSelectedSubject.value = value;
  set setItemSelected(int value) => _itemSelectedPositionSubject.value = value;
  set setErrorPlanSelected(bool value) =>
      _errorPlanSelectedSubject.value = value;
  set setErrorItemSelected(bool value) =>
      _errorItemSelectedSubject.value = value;
}
