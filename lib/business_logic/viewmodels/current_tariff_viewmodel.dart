import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/models/current_applicable_rates/current_applicable_response.dart';
import 'package:xeniusapp/business_logic/services/authentication_service.dart';
import 'package:xeniusapp/locator.dart';

import 'base_viewmodel.dart';

class CurrentTariffViewModel extends BaseViewModel {
  AuthenticationService _service = locator<AuthenticationService>();

  Future<Response<CurrentApplicableResponse>> getCurrentTariff() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    String loginId = userPref.getString('login_id');
    String password = userPref.getString('password');
    setState(ViewState.Busy);

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var currentTariff = await _service.getCurrentTariff(loginId, password);
        setState(ViewState.Idle);
        setState(ViewState.Idle);
        return currentTariff;
      } else {
        return null;
      }
    } on SocketException catch (_) {
      return null;
    }
  }
}
