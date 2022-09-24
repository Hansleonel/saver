import 'package:flutter/material.dart';
import 'package:saver/constants.dart';
import 'package:saver/pages/login/login_page.dart';
import 'package:saver/pages/plan/plan_page_first.dart';
import 'package:saver/widgets/widgets.dart';

class OnBoardingPage extends StatelessWidget {
  static const route = 'onboarding';
  OnBoardingPage({Key? key}) : super(key: key);
  final List<String> titlesOnBoarding = [
    'Gift',
    'Choose',
    'Goal',
  ];
  final List<String> subTitlesOnBoarding = [
    'Choose a device or gift and we will help you get it, in the shortest possible time',
    'You can save as much money as you want, just choose your goal and follow our instructions',
    'Choose an amount and we help you save it',
  ];
  final List<String> iconsOnBoarding = [
    'Airpod',
    'AirpodMax',
    'Drone',
  ];
  @override
  Widget build(BuildContext context) {
    // this widget can handle if we need to go back or not to the previus
    // page without deleting the scope of the of the previus pages,
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            // leading: Container(),
            ),
        body: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              SaverSlideSwiper(
                titles: titlesOnBoarding,
                subTitles: subTitlesOnBoarding,
                icons: iconsOnBoarding,
              ),
              const SizedBox(
                height: 64,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('You have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.route);
                    },
                    child: const Text('Sign In'),
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 24, right: 16, left: 16),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PlanPageFirst.route);
              },
              child: const Text('START SAVING')),
        ),
      ),
    );
  }
}
