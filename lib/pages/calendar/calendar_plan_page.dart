import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/constants.dart';

class CalendarPlanPage extends StatelessWidget {
  const CalendarPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar Plan',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: GridView.builder(
              itemCount: 40,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                maxCrossAxisExtent: 160,
              ),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue,
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/Airpod.svg",
                      height: 96,
                      width: 96,
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
