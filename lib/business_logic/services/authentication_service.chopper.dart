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
}
