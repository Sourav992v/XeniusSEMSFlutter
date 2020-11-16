import 'dart:async';
import 'dart:io' show InternetAddress, Platform, SocketException;

import 'package:flutter/cupertino.dart';

import 'package:connectivity/connectivity.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:xeniusapp/business_logic/services/authentication_service.dart';
import 'package:xeniusapp/business_logic/viewmodels/auth_viewmodel.dart';

import 'package:xeniusapp/components/check_box.dart';

import 'package:xeniusapp/components/rounded_input_field.dart';
import 'package:xeniusapp/components/rounded_password_field.dart';
import 'package:xeniusapp/components/sign_in_button.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/base_view.dart';
import 'package:xeniusapp/ui/view/fortgot_password/password_input_view.dart';
import 'package:xeniusapp/ui/view/home/home.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:xeniusapp/ui/view/util/change_password_view.dart';

class LoginHeader extends StatefulWidget {
  final TextEditingController loginIdController;
  final TextEditingController passwordController;
  final String fcmToken;

  const LoginHeader({
    @required this.loginIdController,
    @required this.passwordController,
    this.fcmToken,
  });

  @override
  _LoginHeaderState createState() => _LoginHeaderState();
}

class _LoginHeaderState extends State<LoginHeader> {
  bool _obscureText = true;
  bool _clicked = false;
  double _opacity = 1.0;

  AuthenticationService authenticationService = locator<AuthenticationService>();


  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }




  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String platform = Platform.isIOS ? 'IOS':'ANDROID';
    return BaseView<AuthViewModel>(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/login_xenius_background.png"),
                            fit: BoxFit.fill,
                            alignment: Alignment.center),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child:Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Text(
                                    "Smart Energy Management Solution",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.bold,
                                        color: kTextColor),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  RoudedInputField(
                                    loginIdController: widget.loginIdController,
                                    icon: Icons.person,
                                    hintText: "Login Id",
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RoudedPasswordField(
                                    passwordController: widget.passwordController,
                                    obscureText: _obscureText,
                                  ),
                                  CheckBoxCostume(
                                    title: 'Show Password',
                                    value: !_obscureText,
                                    checked: (bool value) {
                                      toggle();
                                    },
                                  ),
                                  SignInButton(
                                    clicked: _clicked,
                                    opacity: _opacity,
                                    press: () async {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        _clicked = true;
                                        _opacity = 0.0;
                                      });

                                      SharedPreferences userPref =
                                      await SharedPreferences.getInstance();

                                        String fcmToken =
                                            userPref.getString('fcmToken') ?? '';
                                      try {
                                        final result = await InternetAddress.lookup('google.com');
                                        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                          var success = await authenticationService.getAuthUser(widget.loginIdController.text, widget.passwordController.text,
                                              fcmToken, platform);

                                          if (success.body.rc == 0) {


                                            userPref.setString('login_id',
                                                widget.loginIdController.text);
                                            userPref.setString('password',
                                                widget.passwordController.text);
                                            userPref.setBool('login', true);
                                            var loginCount =
                                            await model.setLoginCount(1);

                                            if (loginCount
                                                .body.resource.login_count ==
                                                '0') {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                        return ChangePassword();
                                                      },
                                                      fullscreenDialog: true));
                                            } else {
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                  Home.id,
                                                      (Route<dynamic> route) =>
                                                  false);
                                            }
                                          } else {
                                            setState(() {
                                              _clicked = false;
                                              _opacity = 1.0;
                                            });
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                'Invalid credentials!',
                                                style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                              backgroundColor: kColorPrimaryDark,
                                            ));
                                          }

                                        } else {
                                          return null;
                                        }
                                      } on SocketException catch (_) {
                                        setState(() {
                                          _clicked = false;
                                          _opacity = 1.0;
                                        });
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            'No Internet Connection!',
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          backgroundColor: kColorPrimaryDark,
                                        ));

                                      }


                                    },
                                  ),
                                  FlatButton(
                                    onPressed: () {

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) {
                                                return PasswordInput();
                                              },
                                              fullscreenDialog: true));

                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Powered by Xenia",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.bold,
                                      color: kColorSecondary,
                                    ),
                                  ),
                                ],
                            ),
                              ),
                                  ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
