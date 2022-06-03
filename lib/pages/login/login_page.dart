import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/blocs/login_bloc.dart';
import 'package:saver/constants.dart';
import 'package:saver/widgets/saver_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userTxtEditCntrl = TextEditingController();
  TextEditingController passwordTxtEditCntrl = TextEditingController();
  final loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SAVER'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to Saver",
                style: Theme.of(context).textTheme.headline5,
              ),
              const Text("Log in to save your money records"),
              const SizedBox(height: defaultPadding),
              SaverInputField(
                textEditingController: userTxtEditCntrl,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorText: "Enter a valid email address",
                hintText: "Email address",
                prefixIcon: "assets/icons/Message.svg",
              ),
              const SizedBox(height: defaultPadding),
              SaverInputField(
                textEditingController: passwordTxtEditCntrl,
                obscureText: true,
                textInputAction: TextInputAction.next,
                hintText: "Password",
                prefixIcon: "assets/icons/Lock.svg",
              ),
              Align(
                child: TextButton(
                  child: const Text("Forgot password"),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height:
                    _size.height > 700 ? _size.height * 0.1 : defaultPadding,
              ),
              StreamBuilder<bool>(
                  //initialData: true,
                  stream: loginBloc.loginStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!) {
                        print('4 ahora si navegar');
                        Future.delayed(const Duration(milliseconds: 200), () {
                          Navigator.pushReplacementNamed(context, 'home');
                        });
                        //Navigator.pushReplacementNamed(context, 'home');
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, 'home', ModalRoute.withName('login'));
                      }
                      return ElevatedButton(
                          onPressed: null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('CARGANDO'),
                              SizedBox(
                                width: 8.0,
                              ),
                              CircularProgressIndicator.adaptive()
                            ],
                          ));
                    }
                    return ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        child: const Text('LOGIN'));
                    // return ElevatedButton(
                    //     onPressed: login, child: const Text('LOGIN'));
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign Up'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    print('1 ingresa');
    if (userTxtEditCntrl.text.isNotEmpty &&
        passwordTxtEditCntrl.text.isNotEmpty) {
      loginBloc.login(userTxtEditCntrl.text, passwordTxtEditCntrl.text);
    }
  }

  @override
  void dispose() {
    super.dispose();
    loginBloc.disposeStream();
  }
}
