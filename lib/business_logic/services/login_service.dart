import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:xeniusapp/business_logic/models/login_resource.dart';
import 'package:xeniusapp/business_logic/services/authentication_service.dart';
import 'package:xeniusapp/locator.dart';

class LoginService{
AuthenticationService _authService= locator<AuthenticationService>();

StreamController<LoginResource> userController = StreamController<LoginResource>();

Future<bool> login(int userId) async {
  SharedPreferences userPref = await SharedPreferences.getInstance();
  String loginId = userPref.getString('login_id');
  String password = userPref.getString('password');
  var fetchedUser = await _authService.getUser(loginId, password);

  var hasUser = fetchedUser != null;
  if(hasUser) {
    userController.add(fetchedUser.body);
  }

  return hasUser;
}
}