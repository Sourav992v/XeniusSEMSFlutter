import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/viewmodels/reset_password_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/ui/view/base_view.dart';
import 'package:xeniusapp/ui/view/fortgot_password/screen_arguments.dart';

import 'package:xeniusapp/ui/view/login/login_view.dart';

class ResetPassword extends StatefulWidget {
  static const String id = 'reset_password_view';

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  final TextEditingController passwordEditText = TextEditingController();

  final TextEditingController confirmEditText = TextEditingController();

  bool _progressIndicator = false;
  bool _errorText = false;

  String _buttonText = 'Submit';

  @override
  Widget build(BuildContext context) {

    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return BaseView<ResetPasswordViewModel>(
      builder:  (context, model, child) => Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Container(
            child: Align(
              alignment: Alignment.topCenter,
              child: ListView(
                physics: MediaQuery.of(context).viewInsets == EdgeInsets.zero
                    ? NeverScrollableScrollPhysics()
                    : null,
                padding: EdgeInsets.all(32.0),
                shrinkWrap: true,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 48.0),
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.white,
                      child: Image.asset('assets/images/ic_password_reset.png'),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Reset Your Password',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextField(
                    controller: passwordEditText,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      suffixIcon: _errorText ? Icon(Icons.error, color: Colors.redAccent,): null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kColorPrimaryDark),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(

                    controller: confirmEditText,
                    keyboardType: TextInputType.text,
                    obscureText: true,

                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Confirm Password',
                      suffixIcon: _errorText ? Icon(Icons.error, color: Colors.redAccent,): null,
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kColorPrimaryDark),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ButtonTheme(
                        minWidth: 250.0,
                        child: RaisedButton(
                          padding: EdgeInsets.all(16.0),
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          textColor: Colors.white,
                          color: kColorPrimary,
                          highlightElevation: 16.0,
                          child: _progressIndicator?Text(''):Text(
                            _buttonText,
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async{
                            FocusScope.of(context).unfocus();
                            setState(() {
                              _progressIndicator = true;
                            });

                            if(passwordEditText.text.isNotEmpty && confirmEditText.text.isNotEmpty){
                              if(passwordEditText.text == confirmEditText.text)
                                {
                                  setState(() {
                                    _progressIndicator = true;
                                    _errorText = false;
                                  });
                                  var response = await model.setPassword(args.loginId,
                                      confirmEditText.text);
                                  if(response.body.rc == 0){
                                    setState(() {
                                      _progressIndicator = false;
                                      _buttonText = 'Please wait ...';
                                    });
                                    Navigator.of(context).pushReplacementNamed(LoginView.id);
                                  } else {
                                    setState(() {
                                      _progressIndicator = false;
                                      _buttonText = 'Submit';
                                      _errorText = true;
                                    });
                                    snackBar(
                                        '${response.body.message}');
                                  }
                                }else{
                                setState(() {
                                  _progressIndicator = false;
                                  _errorText = true;
                                  snackBar('Input Mismatch!');
                                });
                              }


                            }else{
                              setState(() {
                                _progressIndicator = false;
                                _errorText = true;
                                snackBar('Invalid Input!');
                              });
                            }
                          }),
                      ),
                      Positioned(child: _progressIndicator?
                      SpinKitFadingCircle(size: 48, color: Colors.white,)
                          :Container()),
          ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void snackBar(String text) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        text,
        style: TextStyle(
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
      backgroundColor: kColorPrimaryDark,
    ));
  }
}
