import 'package:flutter/material.dart';
import 'package:saver/blocs/provider/provider.dart';
import 'package:saver/blocs/register_bloc.dart';
import 'package:saver/constants.dart';
import 'package:saver/dependency_injections/injection.dart';
import 'package:saver/models/storage/login_user.dart';
import 'package:saver/widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  static const route = 'register';
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController userNameTxtEditCntrl = TextEditingController();
  final TextEditingController userMailTxtEditCntrl = TextEditingController();
  final TextEditingController passwordTxtEditCntrl = TextEditingController();
  final TextEditingController rePasswordTxtEditCntrl = TextEditingController();
  final RegisterBloc? registerBloc =
      Provider.of<RegisterBloc>(() => getIt.get<RegisterBloc>());

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
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
                "Create an account",
                style: Theme.of(context).textTheme.headline5,
              ),
              const Text("get your new goal with your new account"),
              const SizedBox(height: defaultPadding),
              SaverInputField(
                textEditingController: userNameTxtEditCntrl,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorText: "Enter a valid user name",
                hintText: "User name",
                prefixIcon: "assets/icons/Profile.svg",
              ),
              const SizedBox(height: defaultPadding),
              SaverInputField(
                textEditingController: userMailTxtEditCntrl,
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
              const SizedBox(height: defaultPadding),
              SaverInputField(
                textEditingController: rePasswordTxtEditCntrl,
                obscureText: true,
                textInputAction: TextInputAction.next,
                hintText: "Repeat Password",
                prefixIcon: "assets/icons/Lock.svg",
              ),
              SizedBox(
                height:
                    _size.height > 700 ? _size.height * 0.1 : defaultPadding,
              ),
              StreamBuilder<bool>(
                  stream: registerBloc!.registerStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!) {
                        // NAVIGATION
                        Future.delayed(const Duration(milliseconds: 200), () {
                          Navigator.pop(context);
                        });
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
                          register();
                        },
                        child: const Text('REGISTER'));
                  })
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    print('1 ingresa');
    if (userNameTxtEditCntrl.text.isNotEmpty &&
        userMailTxtEditCntrl.text.isNotEmpty &&
        passwordTxtEditCntrl.text.isNotEmpty &&
        rePasswordTxtEditCntrl.text.isNotEmpty) {
      if (passwordTxtEditCntrl.text != rePasswordTxtEditCntrl.text) {
        print('password needs to be the same with repeat password');
      } else if (passwordTxtEditCntrl.text == rePasswordTxtEditCntrl.text) {
        LoginUser loginUser = LoginUser(userNameTxtEditCntrl.text,
            userMailTxtEditCntrl.text, passwordTxtEditCntrl.text, true);
        registerBloc!.save(loginUser);
      }
    }
    //registerBloc!.getLoginUser('user');
  }
}
