import 'package:flutter/material.dart';
import 'package:xeniusapp/constants.dart';

class SignInButton extends StatefulWidget {

  final Function press;
  final bool clicked;
  final double opacity;

  const SignInButton({Key key,this.press, this.clicked, this.opacity}) : super(key: key);

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: widget.press,
          child: AnimatedContainer(
            width: !widget.clicked ? 290: 60,
            height: 60,
            duration: Duration(seconds: 3),
            alignment: FractionalOffset.center,
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
                color: kColorAccentRed,
                borderRadius:
                    BorderRadius.all(Radius.circular(!widget.clicked?12.0:32.0))),
            child: !widget.clicked? Text(
              "Sign In",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ): Padding(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.white60,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      !widget.clicked ? Colors.pinkAccent : Colors.white)),
              padding: EdgeInsets.all(1),
            ),
          ),
    );
  }
}
