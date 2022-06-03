import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  final bool isSignIn;
  const SignInPage({Key? key, this.isSignIn = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fudge'),
      ),
      body: Column(
        children: [
          Text(isSignIn ? 'Sign in by' : 'Sign up by'),
          TextFormField(),
          TextFormField(),
          TextFormField(),
          TextFormField()
        ],
      ),
    );
  }
}
