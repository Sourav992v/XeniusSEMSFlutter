import 'package:flutter/material.dart';
import 'package:xeniusapp/business_logic/services/authentication_service.dart';
import 'package:xeniusapp/constants.dart';
import 'package:xeniusapp/locator.dart';

import 'package:xeniusapp/ui/view/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatelessWidget {
  static const String id = 'change_password_view';

  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController changePassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        title: Text('Change Password',
            textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      ),
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
                    child: Image.asset('assets/images/ic_reset_password.png'),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Change Your Password',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextField(
                  controller: changePassword,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    hintText: 'Password',
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
                  controller: confirmPassword,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Confirm Password',
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
                Builder(
                  builder: (context) => RaisedButton(
                      padding: EdgeInsets.all(16.0),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      textColor: Colors.white,
                      color: kColorPrimary,
                      highlightElevation: 16.0,
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        String loginId =
                            sharedPreferences.getString('login_id') ?? '';
                        String password =
                            sharedPreferences.getString('password') ?? '';
                        var result =
                            await _authenticationService.setPasswordChange(
                                loginId, password, confirmPassword.text);
                        if (changePassword.text == confirmPassword.text) {
                          if (result.body.rc != 0) {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text(
                                'Error!',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                ),
                              ),
                              backgroundColor: kColorPrimaryDark,
                            ));
                          } else {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginView.id);
                          }
                        } else {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(
                              'Input Mismatch!',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0,
                              ),
                            ),
                            backgroundColor: kColorPrimaryDark,
                          ));
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
