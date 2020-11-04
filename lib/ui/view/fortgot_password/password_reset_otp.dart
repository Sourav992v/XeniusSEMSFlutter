import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/viewmodels/reset_password_viewmodel.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';
import 'package:xeniusapp/ui/view/base_view.dart';
import 'package:xeniusapp/ui/view/fortgot_password/reset_password_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:xeniusapp/ui/view/fortgot_password/screen_arguments.dart';

class PasswordResetOtp extends StatefulWidget {
  static const String id = 'password_reset_otp';

  @override
  _PasswordResetOtpState createState() => _PasswordResetOtpState();
}

class _PasswordResetOtpState extends State<PasswordResetOtp> {

  ResetPasswordViewModel _resetPasswordViewModel = locator<ResetPasswordViewModel>();
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  StreamController<ErrorAnimationType> errorController;
  bool _progressIndicator = false;

  String loginId;


  bool hasError = false;
  String currentText = '';
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {

    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () async{
      _resetPasswordViewModel.resendAuthOTP(loginId).then((value) => print('OTP Sent Successfully!'));
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }
  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    setState(() {
      loginId = args.loginId;
    });

    return BaseView<ResetPasswordViewModel>(
      builder: (context, model, child) => Scaffold(
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
                      child: Image.asset('assets/images/ic_otp_verification.png'),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(args.message, style: kSubValueTextStyle,maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 24),
                        child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,
                            obscureText: false,
                            obscuringCharacter: '*',
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v.length < 3) {
                                return "Too short!";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 60.0,
                              fieldWidth: 40.0,
                              activeFillColor:
                                  hasError ? kColorAccentRed : Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            textStyle: TextStyle(fontSize: 20.0, height: 1.6),
                            backgroundColor: Colors.blue.shade50,
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            boxShadows: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              print('Completed');
                            },
                            onChanged: (value) {
                              setState(() {
                                currentText = value;
                              });
                            })),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Didn't receive the code? ",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                        children: [
                          TextSpan(
                              text: " RESEND",
                              recognizer: onTapRecognizer,
                              style: TextStyle(
                                  color: Color(0xFF91D3B3),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16))
                        ]),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Builder(
                    builder:(context) => Stack(
                        alignment: Alignment.center,
                        children: [
                          ButtonTheme(
                            minWidth: 200.0,
                            child: RaisedButton.icon(
                            padding: EdgeInsets.all(16.0),
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            textColor: Colors.white,
                            color: kColorPrimary,
                            highlightElevation: 16.0,
                            icon: _progressIndicator?Container():Icon(Icons.navigate_next),
                            label: _progressIndicator?Text(''):Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async{
                              setState(() {
                                _progressIndicator = true;
                              });
                              if(textEditingController.text.isNotEmpty &&
                                  textEditingController.text.length == 6) {
                                setState(() {
                                  _progressIndicator = true;
                                });
                                var response = await model.getAuthOTP(loginId,
                                    textEditingController.text);
                                if (model.state == ViewState.Idle) {
                                  if (response.body.rc == 0) {
                                    setState(() {
                                      _progressIndicator = false;
                                    });
                                    Navigator.of(context)
                                        .pushReplacementNamed(ResetPassword.id);
                                  } else {
                                    snackBar(
                                        'Something went wrong. Please try again!');
                                  }
                                } else {
                                  setState(() {
                                    _progressIndicator = false;
                                    snackBar(
                                        'Something went wrong. Please try again!');
                                  });
                                }
                              }else{
                                setState(() {
                                  _progressIndicator = false;
                                  snackBar(
                                      'Invalid input!');
                                });
                              }

                            }),
                          ),
                          Positioned(child: _progressIndicator?
                          SpinKitFadingCircle(size: 48, color: Colors.white,)
                              :Container()),
          ]
                    ),
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
