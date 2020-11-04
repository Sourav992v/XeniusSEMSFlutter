import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'resend_otp_response.g.dart';

abstract class ResendOTPResponse
    implements Built<ResendOTPResponse, ResendOTPResponseBuilder> {
  @nullable
  int get rc;

  @nullable
  String get message;

  ResendOTPResponse._();

  factory ResendOTPResponse([updates(ResendOTPResponseBuilder b)]) = _$ResendOTPResponse;

  static Serializer<ResendOTPResponse> get serializer => _$resendOTPResponseSerializer;
}