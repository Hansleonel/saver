import 'package:flutter/material.dart';
import 'package:saver/constants.dart';

class SaverErrorText extends StatelessWidget {
  final String errorText;
  const SaverErrorText({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      errorText,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: errorColor),
    );
  }
}
