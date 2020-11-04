import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_otp_response.g.dart';

abstract class AuthOTPResponse
    implements Built<AuthOTPResponse, AuthOTPResponseBuilder> {
  @nullable
  int get rc;

  @nullable
  String get message;

  AuthOTPResponse._();

  factory AuthOTPResponse([updates(AuthOTPResponseBuilder b)]) = _$AuthOTPResponse;

  static Serializer<AuthOTPResponse> get serializer => _$authOTPResponseSerializer;
}