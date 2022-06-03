import 'package:rxdart/rxdart.dart';

class PlanBloc {
  final _itemSelectedPositionSubject = BehaviorSubject<int>();
  final _errorItemSelectedSubject = BehaviorSubject<bool>();

  ValueStream<int> get itemSelected => _itemSelectedPositionSubject.stream;
  ValueStream<bool> get errorSelected => _errorItemSelectedSubject.stream;

  set setItemSelected(int value) => _itemSelectedPositionSubject.value = value;
  set setErrorSelected(bool value) => _errorItemSelectedSubject.value = value;
}
