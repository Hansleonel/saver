import 'package:flutter/material.dart';
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(width: double.infinity),
            Text(
              "Calendar Plan",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: defaultPadding * 2),
          ]),
        ),
      ),
    );
  }
}
