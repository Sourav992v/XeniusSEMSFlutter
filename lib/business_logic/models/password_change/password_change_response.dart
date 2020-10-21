import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password_change_response.g.dart';

abstract class PasswordChangeResponse
    implements Built<PasswordChangeResponse, PasswordChangeResponseBuilder> {
  @nullable
  int get rc;
  @nullable
  String get message;

  PasswordChangeResponse._();

  factory PasswordChangeResponse([updates(PasswordChangeResponseBuilder b)]) =
      _$PasswordChangeResponse;

  static Serializer<PasswordChangeResponse> get serializer =>
      _$passwordChangeResponseSerializer;
}
