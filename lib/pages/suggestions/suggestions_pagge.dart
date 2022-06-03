import 'package:flutter/material.dart';
import 'package:saver/constants.dart';

class SugggestionsPage extends StatefulWidget {
  SugggestionsPage({Key? key}) : super(key: key);

  @override
  State<SugggestionsPage> createState() => _SugggestionsPageState();
}

class _SugggestionsPageState extends State<SugggestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(width: double.infinity),
        Text(
          "Suggestions",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: defaultPadding * 2),
      ]),
    )));
  }
}
