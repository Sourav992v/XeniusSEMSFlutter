import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/models/daily_report.dart';
import 'package:xeniusapp/business_logic/models/set_config_response.dart';
import 'package:xeniusapp/business_logic/services/authentication_service.dart';
import 'package:xeniusapp/locator.dart';

import 'base_viewmodel.dart';

class SetConfigViewModel extends BaseViewModel {
  AuthenticationService _service = locator<AuthenticationService>();

  Future<Response<SetConfigResponse>> setConfig(String notify_app_balance,
      String notify_unit_consumption,
      String daily_consumption_grid,
      String daily_consumption_dg,
      String notify_power_cut_restore,
      String notify_app_esource,
      String notification_app_recharge
      ) async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    String loginId = userPref.getString('login_id');
    String password = userPref.getString('password');
    setState(ViewState.Busy);

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var setConfigResponse =
            await _service.getSetConfigNotification(loginId, password, notify_app_balance, notify_unit_consumption, daily_consumption_grid,
                daily_consumption_dg, notify_power_cut_restore, notify_app_esource, notification_app_recharge);
        setState(ViewState.Idle);
        setState(ViewState.Idle);
        return setConfigResponse;
      } else {
        return null;
      }
    } on SocketException catch (_) {
      return null;
    }
  }
}
