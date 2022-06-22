import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/blocs/home_bloc.dart';
import 'package:saver/constants.dart';
import 'package:saver/pages/bank/bank_page.dart';
import 'package:saver/pages/suggestions/suggestions_pagge.dart';

class HomePage extends StatefulWidget {
  static const route = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _pagesHome = [
    const BankPage(),
    SugggestionsPage(),
    SugggestionsPage()
  ];
  final homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: 0,
        stream: homeBloc.itemSelected,
        builder: (context, snapshot) {
          return Scaffold(
              body: _pagesHome[snapshot.data!],
              bottomNavigationBar: Container(
                padding: const EdgeInsets.only(top: defaultPadding / 2),
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : const Color(0xFF101015),
                child: BottomNavigationBar(
                  currentIndex: snapshot.data!,
                  onTap: (index) {
                    if (index != snapshot.data) {
                      homeBloc.setItemSelected = index;
                    }
                  },
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xFF101015),
                  type: BottomNavigationBarType.fixed,
                  selectedFontSize: 12,
                  selectedItemColor: primaryColor,
                  unselectedItemColor: Colors.transparent,
                  items: [
                    itemNavigationBar(context, "Payonline", "Bank"),
                    /*BottomNavigationBarItem(
                        icon: SvgPicture.asset("assets/icons/Payonline.svg",
                            height: 24,
                            color: Theme.of(context)
                                .iconTheme
                                .color!
                                .withOpacity(Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? 0.3
                                    : 1)),
                        activeIcon: SvgPicture.asset(
                          "assets/icons/Payonline.svg",
                          height: 24,
                          color: primaryColor,
                        ),
                        label: "Bank"),*/
                    itemNavigationBar(context, "Coupon", "Suggestion"),
                    /*BottomNavigationBarItem(
                        icon: SvgPicture.asset("assets/icons/Coupon.svg",
                            height: 24,
                            color: Theme.of(context)
                                .iconTheme
                                .color!
                                .withOpacity(Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? 0.3
                                    : 1)),
                        activeIcon: SvgPicture.asset(
                          "assets/icons/Coupon.svg",
                          height: 24,
                          color: primaryColor,
                        ),
                        label: "Suggestion"),*/
                    itemNavigationBar(context, "Profile", "Profile")
                    /*BottomNavigationBarItem(
                        icon: SvgPicture.asset("assets/icons/Profile.svg",
                            height: 24,
                            color: Theme.of(context)
                                .iconTheme
                                .color!
                                .withOpacity(Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? 0.3
                                    : 1)),
                        activeIcon: SvgPicture.asset(
                          "assets/icons/Profile.svg",
                          height: 24,
                          color: primaryColor,
                        ),
                        label: "Profile")*/
                  ],
                ),
              ));
        });
  }
}

BottomNavigationBarItem itemNavigationBar(
    BuildContext context, String icon, String label) {
  return BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/icons/$icon.svg",
          height: 24,
          color: Theme.of(context).iconTheme.color!.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.3 : 1)),
      activeIcon: SvgPicture.asset(
        "assets/icons/$icon.svg",
        height: 24,
        color: primaryColor,
      ),
      label: label);
}
