import 'dart:io';


import 'package:chopper/chopper.dart';
import 'package:xeniusapp/business_logic/enum/viewstate.dart';
import 'package:xeniusapp/business_logic/models/coupon_recharge_response.dart';



import 'package:xeniusapp/business_logic/services/authentication_service.dart';

import 'package:xeniusapp/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_viewmodel.dart';

class CouponRechargeViewModel extends BaseViewModel {
  final AuthenticationService _authService = locator<AuthenticationService>();

  CouponRechargeResponse couponRechargeResponse;

  String errorMessage;
  Future<Response<CouponRechargeResponse>> rechargeCoupon(String coupon) async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    String loginId = userPref.getString('login_id');
    String password = userPref.getString('password');

    setState(ViewState.Busy);

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var resource = await _authService.getCouponRecharge(loginId, password, coupon);
        couponRechargeResponse = resource.body;
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
