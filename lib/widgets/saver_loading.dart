import 'package:flutter/material.dart';

class SaverLoading extends StatelessWidget {
  final String textSaverLoading;
  const SaverLoading({Key? key, required this.textSaverLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16.0),
        Text(textSaverLoading)
      ],
    );
  }
}
