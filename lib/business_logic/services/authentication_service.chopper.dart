// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$AuthenticationService extends AuthenticationService {
  _$AuthenticationService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthenticationService;

  @override
  Future<Response<AuthResource>> getAuthUser(
      String loginId, String password, String device_token, String device_os) {
    final $url = 'login';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password,
      'device_token': device_token,
      'device_OS': device_os
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<AuthResource, AuthResource>($request);
  }

  @override
  Future<Response<LoginResource>> getUser(String loginId, String password) {
    final $url = 'login';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<LoginResource, LoginResource>($request);
  }

  @override
  Future<Response<LoginCountResponse>> setLoginCount(
      String loginId, String password, int loginCount) {
    final $url = 'login';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password,
      'login_count': loginCount
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<LoginCountResponse, LoginCountResponse>($request);
  }

  @override
  Future<Response<DailyReport>> getDailyReport(
      String loginId, String password, int year, int month) {
    final $url = 'consumption/daily';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password,
      'year': year,
      'month': month
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<DailyReport, DailyReport>($request);
  }

  @override
  Future<Response<MonthlyReport>> getMonthlyReport(
      String loginId, String password, int year) {
    final $url = 'consumption/monthly';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password,
      'year': year
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MonthlyReport, MonthlyReport>($request);
  }

  @override
  Future<Response<ComparativeReport>> getComparativeReport(
      String loginId, String password, int year, int month) {
    final $url = 'comparative';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password,
      'year': year,
      'month': month
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ComparativeReport, ComparativeReport>($request);
  }

  @override
  Future<Response<CurrentApplicableResponse>> getCurrentTariff(
      String loginId, String password) {
    final $url = 'current_applicable_rates';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<CurrentApplicableResponse, CurrentApplicableResponse>($request);
  }

  @override
  Future<Response<PasswordChangeResponse>> setPasswordChange(
      String loginId, String password, String newPassword) {
    final $url = 'change_password';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password,
      'new_password': newPassword
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<PasswordChangeResponse, PasswordChangeResponse>($request);
  }

  @override
  Future<Response<NoticeResponse>> getNotice(String loginId, String password) {
    final $url = 'notice';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<NoticeResponse, NoticeResponse>($request);
  }

  @override
  Future<Response<MessageResponse>> getMessages(
      String loginId, String password) {
    final $url = 'xenius_messages';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MessageResponse, MessageResponse>($request);
  }

  @override
  Future<Response<RechargeHistoryResponse>> getRechargeHistory(
      String loginId, String password) {
    final $url = 'recharge_history_new';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<RechargeHistoryResponse, RechargeHistoryResponse>($request);
  }

  @override
  Future<Response<SetConfigResponse>> getSetConfigNotification(
      String loginId,
      String password,
      String notify_app_balance,
      String notify_unit_consumption,
      String daily_consumption_grid,
      String daily_consumption_dg,
      String notify_power_cut_restore,
      String notify_app_esource,
      String notification_app_recharge) {
    final $url = 'config/set_config';
    final $params = <String, dynamic>{
      'login_id': loginId,
      'password': password,
      'notification_app_balance': notify_app_balance,
      'notification_app_unit_consumption': notify_unit_consumption,
      'alert_daily_consumption_grid': daily_consumption_grid,
      'alert_daily_consumption_dg': daily_consumption_dg,
      'notification_power_cut_restore': notify_power_cut_restore,
      'notification_app_esource': notify_app_esource,
      'notification_app_recharge': notification_app_recharge
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<SetConfigResponse, SetConfigResponse>($request);
  }

  @override
  Future<Response<CouponRechargeResponse>> getCouponRecharge(String coupon_id) {
    final $url = 'recharge';
    final $params = <String, dynamic>{'coupon_id': coupon_id};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<CouponRechargeResponse, CouponRechargeResponse>($request);
  }

  @override
  Future<Response<RemoveFirebaseTokenResponse>> removeFCMToken(
      String device_token, String device_os) {
    final $url = 'update_token';
    final $params = <String, dynamic>{
      'device_token': device_token,
      'device_OS': device_os
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<RemoveFirebaseTokenResponse,
        RemoveFirebaseTokenResponse>($request);
  }

  @override
  Future<Response<PowerControlResponse>> getPowerControl(String controlString) {
    final $url = '$controlString';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<PowerControlResponse, PowerControlResponse>($request);
  }

  @override
  Future<Response<ForgotPasswordResponse>> getForgotPassword(
      String login_id, String mobile_no) {
    final $url = 'forget_password';
    final $params = <String, dynamic>{
      'login_id': login_id,
      'mobile_no': mobile_no
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<ForgotPasswordResponse, ForgotPasswordResponse>($request);
  }

  @override
  Future<Response<AuthOTPResponse>> getAuthOTP(String login_id, String otp) {
    final $url = 'otp_varify';
    final $params = <String, dynamic>{'login_id': login_id, 'otp': otp};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<AuthOTPResponse, AuthOTPResponse>($request);
  }

  @override
  Future<Response<ResendOTPResponse>> getOTP(String login_id) {
    final $url = 'resend_otp';
    final $params = <String, dynamic>{'login_id': login_id};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ResendOTPResponse, ResendOTPResponse>($request);
  }

  @override
  Future<Response<PasswordResetResponse>> getPasswordReset(
      String login_id, String password) {
    final $url = 'password_change';
    final $params = <String, dynamic>{
      'login_id': login_id,
      'password': password
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PasswordResetResponse, PasswordResetResponse>($request);
  }
}
