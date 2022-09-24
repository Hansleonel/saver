import 'package:flutter/material.dart';
import 'package:saver/blocs/login_bloc.dart';
import 'package:saver/blocs/provider/provider.dart';
import 'package:saver/constants.dart';
import 'package:saver/dependency_injections/injection.dart';
import 'package:saver/pages/home/home_page.dart';
import 'package:saver/pages/register/register_page.dart';
import 'package:saver/widgets/saver_input_field.dart';

class LoginPage extends StatefulWidget {
  static const route = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userTxtEditCntrl = TextEditingController();
  TextEditingController passwordTxtEditCntrl = TextEditingController();

  // TODO we need to use the dependecy injection when the bloc uses multiple usecases
  final LoginBloc? loginBloc =
      Provider.of<LoginBloc>(() => getIt.get<LoginBloc>());

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saver',
          style: Theme.of(context).textTheme.headline6,
        ),
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
                errorText: "Enter your user name",
                hintText: "User Name",
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
                  stream: loginBloc!.loginStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data! && !loginBloc!.loginError) {
                        print('4 ahora si navegar');
                        Future.delayed(const Duration(milliseconds: 200), () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomePage.route, (route) => false);
                        });
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, 'home', ModalRoute.withName('login'));
                      }
                      return Column(
                        children: [
                          loginBloc!.loginError
                              ? const Text(
                                  'Error with the login please try again',
                                  style: TextStyle(color: errorColor))
                              : const SizedBox(),
                          const SizedBox(height: defaultPadding),
                          ElevatedButton(
                              onPressed: loginBloc!.loginError ? login : null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(loginBloc!.loginError
                                      ? 'LOGIN'
                                      : 'LOADING'),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  loginBloc!.loginError
                                      ? const SizedBox.shrink()
                                      : const CircularProgressIndicator
                                          .adaptive()
                                ],
                              )),
                        ],
                      );
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
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterPage.route);
                    },
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
      loginBloc!.login(userTxtEditCntrl.text, passwordTxtEditCntrl.text);
    }
  }

  @override
  void dispose() {
    super.dispose();
    // loginBloc!.disposeStream();
  }
}
