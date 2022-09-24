import 'package:flutter/material.dart';
import 'package:saver/pages/home/home_page.dart';
import 'package:saver/pages/login/login_page.dart';
import 'package:saver/pages/onboarding/onboarding_page.dart';
import 'package:saver/pages/plan/plan_page_first.dart';
import 'package:saver/pages/plan/plan_page_first_calculate.dart';
import 'package:saver/pages/plan/plan_page_second.dart';
import 'package:saver/pages/register/register_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.route: (BuildContext context) => const HomePage(),
    LoginPage.route: (BuildContext context) => const LoginPage(),
    OnBoardingPage.route: (BuildContext context) => OnBoardingPage(),
    PlanPageFirst.route: (BuildContext context) => PlanPageFirst(),
    PlanPageFirstCalculate.route: (BuildContext context) =>
        PlanPageFirstCalculate(),
    PlanPageSecond.route: (BuildContext context) => PlanPageSecond(),
    RegisterPage.route: (BuildContext context) => RegisterPage(),
  };
}
