import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/blocs/plan_bloc.dart';
import 'package:saver/blocs/provider/provider.dart';
import 'package:saver/blocs/register_bloc.dart';
import 'package:saver/constants.dart';
import 'package:saver/dependency_injections/injection.dart';
import 'package:saver/models/storage/login_user.dart';
import 'package:saver/models/storage/plan_user.dart';
import 'package:saver/pages/login/login_page.dart';
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
  final PlanBloc? planBloc = Provider.of<PlanBloc>(() => getIt.get<PlanBloc>());

  @override
  Widget build(BuildContext context) {
    print(planBloc!.dayToSave);
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
              StreamBuilder<bool>(
                  stream: registerBloc!.isIconActivePassword,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SaverInputField(
                        textEditingController: passwordTxtEditCntrl,
                        obscureText: !snapshot.data!,
                        textInputAction: TextInputAction.next,
                        hintText: "Password",
                        prefixIcon: "assets/icons/Lock.svg",
                        suffixIcon: InkWell(
                          child: SvgPicture.asset(
                            "assets/icons/FaceId.svg",
                            height: 24,
                            width: 24,
                            color: snapshot.data!
                                ? primaryColor
                                : Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!
                                    .withOpacity(0.3),
                          ),
                          onTap: () {
                            registerBloc!.setIsIconActivePassword =
                                !snapshot.data!;
                          },
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),
              const SizedBox(height: defaultPadding),
              StreamBuilder<bool>(
                  stream: registerBloc!.isIconActiveRepeatPassword,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SaverInputField(
                        textEditingController: rePasswordTxtEditCntrl,
                        obscureText: !snapshot.data!,
                        textInputAction: TextInputAction.next,
                        hintText: "Repeat Password",
                        prefixIcon: "assets/icons/Lock.svg",
                        suffixIcon: InkWell(
                          child: SvgPicture.asset(
                            "assets/icons/FaceId.svg",
                            height: 24,
                            width: 24,
                            color: snapshot.data!
                                ? primaryColor
                                : Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!
                                    .withOpacity(0.3),
                          ),
                          onTap: () {
                            registerBloc!.setIsIconActiveRepeatPassword =
                                !snapshot.data!;
                          },
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),
              const SizedBox(height: defaultPadding),
              StreamBuilder<bool>(
                  stream: registerBloc!.hasValidUserName,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (!snapshot.data!) {
                        return const SaverErrorText(
                            errorText:
                                'Your user name is not valid, please change the user name');
                      }
                    }
                    return const SizedBox();
                  }),
              StreamBuilder<bool>(
                  stream: registerBloc!.hasCompleteData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (!snapshot.data!) {
                        return const SaverErrorText(
                            errorText:
                                'You need to complete the data for your register');
                      }
                    }
                    return const SizedBox();
                  }),
              StreamBuilder<bool>(
                  stream: registerBloc!.hasTheSamePassword,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (!snapshot.data!) {
                        return const SaverErrorText(
                            errorText:
                                'You need to have the same password and repeat password');
                      }
                    }
                    return const SizedBox();
                  }),
              SizedBox(
                height:
                    _size.height > 700 ? _size.height * 0.1 : defaultPadding,
              ),
              StreamBuilder<bool>(
                  stream: registerBloc!.registerStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data! &&
                          registerBloc!.hasValidUserName.value) {
                        // NAVIGATION
                        Future.delayed(const Duration(milliseconds: 200), () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginPage.route, (route) => false);
                        });
                      } else if (snapshot.data! &&
                          !registerBloc!.hasValidUserName.value) {
                        return ElevatedButton(
                            onPressed: () {
                              register();
                            },
                            child: const Text('REGISTER'));
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
    if (hasAllDataComplete()) {
      if (!hasSamePasswordAndRepeatPassword()) {
        registerBloc!.setHasSamePassword = false;
        registerBloc!.setHasCompleteData = true;
      } else if (hasSamePasswordAndRepeatPassword()) {
        registerBloc!.setHasSamePassword = true;
        // using the UI to create a new instance of LoginUser
        LoginUser loginUser = LoginUser(userNameTxtEditCntrl.text,
            userMailTxtEditCntrl.text, passwordTxtEditCntrl.text, true);
        // using the bloc "planBloc" to create a new instance of PlanUser
        PlanUser planUser =
            PlanUser(loginUser.user, planBloc!.dayToSave, planBloc!.mountSaved);
        // save the data of the user
        registerBloc!.saveUserData(loginUser, planUser);
      }
    } else {
      if (hasSamePasswordAndRepeatPassword()) {
        registerBloc!.setHasSamePassword = true;
      } else {
        registerBloc!.setHasSamePassword = false;
      }
      registerBloc!.setHasCompleteData = false;
    }
    //registerBloc!.getLoginUser('user');
  }

  bool hasAllDataComplete() {
    return userNameTxtEditCntrl.text.isNotEmpty &&
        userMailTxtEditCntrl.text.isNotEmpty &&
        passwordTxtEditCntrl.text.isNotEmpty &&
        rePasswordTxtEditCntrl.text.isNotEmpty;
  }

  bool hasSamePasswordAndRepeatPassword() {
    return passwordTxtEditCntrl.text == rePasswordTxtEditCntrl.text;
  }
}
