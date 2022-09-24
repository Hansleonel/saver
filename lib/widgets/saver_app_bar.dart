import 'package:flutter/material.dart';

class SaverAppBar extends StatelessWidget {
  final String title;
  const SaverAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
