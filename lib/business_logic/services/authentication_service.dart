import 'dart:io';

import 'package:xeniusapp/business_logic/models/auth_resource.dart';
import 'package:xeniusapp/business_logic/models/comparative/comparative_report.dart';
import 'package:xeniusapp/business_logic/models/coupon_recharge_response.dart';
import 'package:xeniusapp/business_logic/models/current_applicable_rates/current_applicable_response.dart';
import 'package:xeniusapp/business_logic/models/daily_report.dart';

import 'package:xeniusapp/business_logic/models/login_count_response.dart';
import 'package:xeniusapp/business_logic/models/login_resource.dart';

import 'package:chopper/chopper.dart';
import 'package:xeniusapp/business_logic/models/message_response/message_response.dart';
import 'package:xeniusapp/business_logic/models/monthly_report.dart/monthly_report.dart';
import 'package:xeniusapp/business_logic/models/notice_response/notice_response.dart';

import 'package:xeniusapp/business_logic/models/password_change/password_change_response.dart';
import 'package:xeniusapp/business_logic/models/power_control_response.dart';
import 'package:xeniusapp/business_logic/models/recharge_history/recharge_history_response.dart';
import 'package:xeniusapp/business_logic/models/remove_firebase_token_response.dart';
import 'package:xeniusapp/business_logic/models/set_config_response.dart';
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
  Future<Response<AuthResource>> getAuthUser(
      @Query('login_id') String loginId,
      @Query('password') String password,
      @Query('device_token') String device_token,
      @Query('device_OS') String device_os);

  @Get(path: 'login')
  Future<Response<LoginResource>> getUser(
      @Query('login_id') String loginId,
      @Query('password') String password);

  @Get(path: 'login')
  Future<Response<LoginCountResponse>> setLoginCount(
      @Query('login_id') String loginId,
      @Query('password') String password,
      @Query('login_count') int loginCount);

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

  @Get(path: 'current_applicable_rates')
  Future<Response<CurrentApplicableResponse>> getCurrentTariff(
    @Query('login_id') String loginId,
    @Query('password') String password,
  );

  @Get(path: 'change_password')
  Future<Response<PasswordChangeResponse>> setPasswordChange(
      @Query('login_id') String loginId,
      @Query('password') String password,
      @Query('new_password') String newPassword);

  @Get(path: "notice")
  Future<Response<NoticeResponse>> getNotice(
      @Query('login_id') String loginId,
      @Query('password') String password,
      );

  @Get(path:"xenius_messages")
  Future<Response<MessageResponse>> getMessages(
      @Query('login_id') String loginId,
      @Query('password') String password,
      );
  @Get(path:"recharge_history_new")
  Future<Response<RechargeHistoryResponse>> getRechargeHistory(
      @Query('login_id') String loginId,
      @Query('password') String password,
      );

  @Get(path: 'config/set_config')
  Future<Response<SetConfigResponse>> getSetConfigNotification(
      @Query('login_id') String loginId,
      @Query('password') String password,
      @Query('notification_app_balance') String notify_app_balance,
      @Query('notification_app_unit_consumption')String notify_unit_consumption,
      @Query('alert_daily_consumption_grid') String daily_consumption_grid,
      @Query('alert_daily_consumption_dg') String daily_consumption_dg,
      @Query('notification_power_cut_restore')String notify_power_cut_restore,
      @Query('notification_app_esource') String notify_app_esource,
      @Query('notification_app_recharge') String notification_app_recharge
      );

  @Get(path: 'recharge')
  Future<Response<CouponRechargeResponse>> getCouponRecharge(
      @Query('coupon_id') String coupon_id
      );

  @Get(path: 'update_token')
  Future<Response<RemoveFirebaseTokenResponse>> removeFCMToken(
      @Query('device_token') String device_token,
      @Query('device_OS') String device_os
      );

  @Get(path: '{power_control}')
  Future<Response<PowerControlResponse>> getPowerControl(
      @Path('power_control') String controlString
      );
}
