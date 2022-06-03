import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _itemSelectedSubject = BehaviorSubject<int>.seeded(0);

  ValueStream<int> get itemSelected => _itemSelectedSubject.stream;

  set setItemSelected(int value) => _itemSelectedSubject.value = value;
}
