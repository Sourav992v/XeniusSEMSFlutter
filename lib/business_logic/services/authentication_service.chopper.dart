// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$AuthenticationService extends AuthenticationService {
  _$AuthenticationService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = AuthenticationService;

  Future<Response<LoginResource>> getUser(String loginId, String password) {
    final $url = 'login';
    final Map<String, dynamic> $params = {
      'login_id': loginId,
      'password': password
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<LoginResource, LoginResource>($request);
  }

  Future<Response<DailyReportResponse>> getDailyReport(
      String loginId, String password, int year, int month) {
    final $url = 'consumption/daily';
    final Map<String, dynamic> $params = {
      'login_id': loginId,
      'password': password,
      'year': year,
      'month': month
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<DailyReportResponse, DailyReportResponse>($request);
  }

  Future<Response<MonthlyReportResponse>> getMonthlyReport(
      String loginId, String password, int year) {
    final $url = 'consumption/monthly';
    final Map<String, dynamic> $params = {
      'login_id': loginId,
      'password': password,
      'year': year
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MonthlyReportResponse, MonthlyReportResponse>($request);
  }

  Future<Response<PasswordChangeResponse>> setPasswordChange(
      String loginId, String password, String newPassword) {
    final $url = 'change_password';
    final Map<String, dynamic> $params = {
      'login_id': loginId,
      'password': password,
      'new_password': newPassword
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<PasswordChangeResponse, PasswordChangeResponse>($request);
  }
}
