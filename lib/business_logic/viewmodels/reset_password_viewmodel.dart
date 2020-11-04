import 'dart:io';


import 'package:chopper/chopper.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/models/forgot_password/auth_otp_response.dart';
import 'package:xeniusapp/business_logic/models/forgot_password/forgot_password_response.dart';
import 'package:xeniusapp/business_logic/models/forgot_password/password_reset_response.dart';
import 'package:xeniusapp/business_logic/models/forgot_password/resend_otp_response.dart';
import 'package:xeniusapp/business_logic/models/message_response/message_response.dart';


import 'package:xeniusapp/business_logic/services/authentication_service.dart';

import 'package:xeniusapp/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xeniusapp/ui/view/fortgot_password/password_input_view.dart';

import 'base_viewmodel.dart';

class ResetPasswordViewModel extends BaseViewModel {
  final AuthenticationService _authService = locator<AuthenticationService>();

  ForgotPasswordResponse forgotPasswordResponse;

  AuthOTPResponse authOTPResponse;

  ResendOTPResponse resendOTPResponse;

  PasswordResetResponse passwordResetResponse;

  Future<Response<ForgotPasswordResponse>> getPassword(String loginId,String mobileNo) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var resource = await _authService.getForgotPassword(loginId, mobileNo);
        forgotPasswordResponse = resource.body;
        setState(ViewState.Idle);
        return resource;
      } else {
        return null;
      }
    } on SocketException catch (_) {
      return null;
    }
  }

  Future<Response<AuthOTPResponse>> getAuthOTP(String loginId, String otp) async {

    setState(ViewState.Busy);

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var resource = await _authService.getAuthOTP(loginId, otp);
        authOTPResponse = resource.body;
        setState(ViewState.Idle);
        return resource;
      } else {
        return null;
      }
    } on SocketException catch (_) {
      return null;
    }
  }

  Future<Response<ResendOTPResponse>> resendAuthOTP(String loginId) async {


    setState(ViewState.Busy);

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var resource = await _authService.getOTP(loginId);
        resendOTPResponse = resource.body;
        setState(ViewState.Idle);
        return resource;
      } else {
        return null;
      }
    } on SocketException catch (_) {
      return null;
    }
  }

  Future<Response<PasswordResetResponse>> setPassword(String password) async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    String loginId = userPref.getString('login_id');

    setState(ViewState.Busy);

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var resource = await _authService.getPasswordReset(loginId, password);
        passwordResetResponse = resource.body;
        setState(ViewState.Idle);
        return resource;
      } else {
        return null;
      }
    } on SocketException catch (_) {
      return null;
    }
  }
}
