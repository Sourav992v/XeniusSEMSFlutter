import 'dart:io';

import 'package:xeniusapp/business_logic/models/login_resource.dart';

import 'package:chopper/chopper.dart';

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

  @Get(path: 'change_password')
  Future<Response<PasswordChangeResponse>> setPasswordChange(
      @Query('login_id') String loginId,
      @Query('password') String password,
      @Query('new_password') String newPassword);
}
