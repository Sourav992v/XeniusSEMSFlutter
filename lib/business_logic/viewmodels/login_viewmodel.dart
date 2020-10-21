import 'package:chopper/chopper.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';

import 'package:xeniusapp/business_logic/models/login_resource.dart';

import 'package:xeniusapp/business_logic/services/authentication_service.dart';

import 'package:xeniusapp/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_viewmodel.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage;
  Future<Response<LoginResource>> login() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    String loginId = userPref.getString('login_id');
    String password = userPref.getString('password');

    setState(ViewState.Busy);

    var success = await _authenticationService.getUser(loginId, password);

    setState(ViewState.Idle);
    return success;
  }
}
