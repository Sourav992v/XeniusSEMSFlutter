import 'dart:io';

import 'package:xeniusapp/business_logic/models/comparative/comparative_report.dart';
import 'package:xeniusapp/business_logic/models/daily_report.dart';
import 'package:xeniusapp/business_logic/models/login_resource.dart';

import 'package:chopper/chopper.dart';
import 'package:xeniusapp/business_logic/models/monthly_report.dart/monthly_report.dart';

import 'package:xeniusapp/business_logic/models/password_change/password_change_response.dart';
import 'package:xeniusapp/business_logic/services/built_value_converter.dart';
import 'package:xeniusapp/business_logic/services/interceptor/header_interceptor.dart';
import 'package:http/io_client.dart' as http;

part 'authentication_service.chopper.dart';

@ChopperApi()
abstract class AuthenticationService extends ChopperService {
  static AuthenticationService create() {
    final client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      baseUrl: 'http://myxenius.com/thirdparty/api',
      interceptors: [
        HttpLoggingInterceptor(),
        HeaderInterceptor(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: JsonConverter(),
      services: [
        _$AuthenticationService(),
      ],
    );

    return _$AuthenticationService(client);
  }

  @Get(path: 'login')
  Future<Response<LoginResource>> getUser(
      @Query('login_id') String loginId, @Query('password') String password);

  @Get(path: 'consumption/daily')
  Future<Response<DailyReport>> getDailyReport(
    @Query('login_id') String loginId,
    @Query('password') String password,
    @Query('year') int year,
    @Query('month') int month,
  );

  @Get(path: 'consumption/monthly')
  Future<Response<MonthlyReport>> getMonthlyReport(
    @Query('login_id') String loginId,
    @Query('password') String password,
    @Query('year') int year,
  );

  @Get(path: 'comparative')
  Future<Response<ComparativeReport>> getComparativeReport(
    @Query('login_id') String loginId,
    @Query('password') String password,
    @Query('year') int year,
    @Query('month') int month,
  );

  @Get(path: 'change_password')
  Future<Response<PasswordChangeResponse>> setPasswordChange(
      @Query('login_id') String loginId,
      @Query('password') String password,
      @Query('new_password') String newPassword);
}
