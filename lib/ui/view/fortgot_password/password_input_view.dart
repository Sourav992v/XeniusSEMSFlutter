import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/services/authentication_service.dart';
import 'package:xeniusapp/business_logic/viewmodels/reset_password_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/base_view.dart';
import 'package:xeniusapp/ui/view/fortgot_password/password_reset_otp.dart';
import 'package:xeniusapp/ui/view/fortgot_password/screen_arguments.dart';

class PasswordInput extends StatefulWidget {
  static const String id = 'password_input';

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  AuthenticationService _authenticationService = locator<AuthenticationService>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  final TextEditingController loginIdEditText = TextEditingController();

  final TextEditingController mobileNoEditText = TextEditingController();

  bool _progressIndicator = false;
  bool _errorText = false;

  String buttonText = 'Next';

  @override
  Widget build(BuildContext context) {
    return BaseView<ResetPasswordViewModel>(
      builder: (context, value, child) => Scaffold(
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
                    child: Image.asset(
                        'assets/images/ic_reset_password_details.png'),
                      ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Enter your login id and registred phone number.\n We will send youOTP to reset your password',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: loginIdEditText,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      hintText: 'Login Id',
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
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: mobileNoEditText,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                      prefixIcon: Icon(Icons.phone_android),
                      hintText: 'Registered Number',
                      suffixIcon: _errorText ? Icon(Icons.error, color: Colors.redAccent,): null,
                      errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
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
                        child: RaisedButton.icon(
                        padding: EdgeInsets.all(16.0),
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        textColor: Colors.white,
                        color: kColorPrimary,
                        highlightElevation: 16.0,
                        icon: _progressIndicator?Icon(null):Icon(Icons.navigate_next),
                        label: _progressIndicator?Text(''):Text(
                          buttonText,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if(loginIdEditText.text.isNotEmpty && mobileNoEditText.text.isNotEmpty){
                            setState(() {
                              _progressIndicator = true;
                              _errorText = false;
                            });
                            var response = await value.getPassword(loginIdEditText.text.trim(), mobileNoEditText.text.trim());
                            if(value.state == ViewState.Idle){
                              setState(() {
                                _progressIndicator = false;
                                buttonText = 'Please wait ...';
                              });

                              if(response.body.rc == 0){
                                Navigator.of(context)
                                    .pushReplacementNamed(PasswordResetOtp.id,
                                    arguments:ScreenArguments(message:response.body.message, loginId: loginIdEditText.text.trim()));
                              }else{
                                snackBar('${response.body.message}');
                                setState(() {
                                  _errorText = true;
                                  _progressIndicator= false;
                                  buttonText = 'Next';
                                });

                              }

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
