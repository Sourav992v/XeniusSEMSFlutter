import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password_reset_response.g.dart';

abstract class PasswordResetResponse
    implements Built<PasswordResetResponse, PasswordResetResponseBuilder> {
  @nullable
  int get rc;

  @nullable
  String get message;

  PasswordResetResponse._();

  factory PasswordResetResponse([updates(PasswordResetResponseBuilder b)]) = _$PasswordResetResponse;

  static Serializer<PasswordResetResponse> get serializer => _$passwordResetResponseSerializer;
}