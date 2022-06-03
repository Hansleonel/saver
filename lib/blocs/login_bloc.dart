import 'dart:async';

class LoginBloc {
  final _loginStreamController = StreamController<bool>.broadcast();

  Function(bool) get loginSink => _loginStreamController.sink.add;
  Stream<bool> get loginStream => _loginStreamController.stream;

  Future<bool> login(String user, String password) async {
    print('2 bloc rellena con false y espera');
    loginSink(false);
    Future.delayed(const Duration(seconds: 3), () {
      print('3 bloc rellana con true luego de esperar');
      loginSink(true);
    });
    return true;
  }

  void disposeStream() {
    _loginStreamController.close();
  }
}
