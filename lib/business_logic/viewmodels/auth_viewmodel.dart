import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/models/auth_resource.dart';
import 'package:xeniusapp/business_logic/models/login_count_response.dart';

import 'package:xeniusapp/business_logic/services/authentication_service.dart';

import 'package:xeniusapp/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_viewmodel.dart';

class AuthViewModel extends BaseViewModel {
  final AuthenticationService _authService = locator<AuthenticationService>();

  AuthResource authResource;
  LoginCountResponse loginCountResponse;
  Future<Response<AuthResource>> authUser(String fcmToken, String deviceOs) async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    String loginId = userPref.getString('login_id');
    String password = userPref.getString('password');

    setState(ViewState.Busy);

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var resource = await _authService.getAuthUser(loginId, password, fcmToken,deviceOs);
        authResource = resource.body;
        setState(ViewState.Idle);
        return resource;
      } else {
        return null;
      }
    } on SocketException catch (_) {
      return null;
    }
  }

  Future<Response<LoginCountResponse>> setLoginCount(int loginCount) async{
    SharedPreferences userPref = await SharedPreferences.getInstance();
    String loginId = userPref.getString('login_id');
    String password = userPref.getString('password');

    setState(ViewState.Busy);

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var authCount = await _authService.setLoginCount(loginId, password,loginCount);
        loginCountResponse = authCount.body;
        setState(ViewState.Idle);
        return authCount;
      } else {
        return null;
      }
    } on SocketException catch (_) {
      return null;
    }
  }
}
