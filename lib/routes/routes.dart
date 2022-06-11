import 'package:flutter/material.dart';
import 'package:saver/pages/home/home_page.dart';
import 'package:saver/pages/login/login_page.dart';
import 'package:saver/pages/plan/plan_page.dart';
import 'package:saver/pages/register/register_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => const LoginPage(),
    'home': (BuildContext context) => const HomePage(),
    'plan': (BuildContext context) => PlanPage(),
    'register': (BuildContext context) => RegisterPage(),
  };
}
