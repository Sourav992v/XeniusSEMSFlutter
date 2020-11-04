import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'forgot_password_response.g.dart';

abstract class ForgotPasswordResponse
    implements Built<ForgotPasswordResponse, ForgotPasswordResponseBuilder> {
  @nullable
  int get rc;

  @nullable
  String get message;

  ForgotPasswordResponse._();

  factory ForgotPasswordResponse([updates(ForgotPasswordResponseBuilder b)]) = _$ForgotPasswordResponse;

  static Serializer<ForgotPasswordResponse> get serializer => _$forgotPasswordResponseSerializer;
}