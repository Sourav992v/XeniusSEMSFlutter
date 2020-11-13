import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';

import 'package:xeniusapp/business_logic/models/power_control_response.dart';

import 'package:xeniusapp/business_logic/services/authentication_service.dart';

import 'package:xeniusapp/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_viewmodel.dart';

class PowerViewModel extends BaseViewModel {
  final AuthenticationService _authService = locator<AuthenticationService>();

  PowerControlResponse powerResponse;

  String errorMessage;
  Future<Response<PowerControlResponse>> getPowerControl(String controlMode) async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    String loginId = userPref.getString('login_id');
    String password = userPref.getString('password');

    setState(ViewState.Busy);

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var resource = await _authService.getPowerControl(loginId, password, controlMode);
        powerResponse = resource.body;
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
