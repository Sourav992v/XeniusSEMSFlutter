import 'package:flutter/material.dart';
import 'package:xeniusapp/constants.dart';

class SignInButton extends StatelessWidget {
  SignInButton();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 60,
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
          color: kColorAccentRed,
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
    );
  }
}
