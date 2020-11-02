import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'remove_firebase_token_response.g.dart';

abstract class RemoveFirebaseTokenResponse
    implements Built<RemoveFirebaseTokenResponse, RemoveFirebaseTokenResponseBuilder> {
  @nullable
  int get rc;

  @nullable
  String get message;

  RemoveFirebaseTokenResponse._();

  factory RemoveFirebaseTokenResponse([updates(RemoveFirebaseTokenResponseBuilder b)]) = _$RemoveFirebaseTokenResponse;

  static Serializer<RemoveFirebaseTokenResponse> get serializer => _$removeFirebaseTokenResponseSerializer;
}