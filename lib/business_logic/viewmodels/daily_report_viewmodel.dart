import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/models/daily_report.dart';
import 'package:xeniusapp/business_logic/services/authentication_service.dart';
import 'package:xeniusapp/locator.dart';

import 'base_viewmodel.dart';

class DailyReportViewModel extends BaseViewModel {
  AuthenticationService _service = locator<AuthenticationService>();

  Future<Response<DailyReport>> getDailyReportResource(
      int year, int month) async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    String loginId = userPref.getString('login_id');
    String password = userPref.getString('password');
    setState(ViewState.Busy);

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var dailyReportResponse =
            await _service.getDailyReport(loginId, password, year, month);
        setState(ViewState.Idle);
        setState(ViewState.Idle);
        return dailyReportResponse;
      } else {
        return null;
      }
    } on SocketException catch (_) {
      return null;
    }
  }
}
