import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'set_config_response.g.dart';

abstract class SetConfigResponse
    implements Built<SetConfigResponse, SetConfigResponseBuilder> {
  @nullable
  int get rc;

  @nullable
  String get message;

  SetConfigResponse._();

  factory SetConfigResponse([updates(SetConfigResponseBuilder b)]) = _$SetConfigResponse;

  static Serializer<SetConfigResponse> get serializer => _$setConfigResponseSerializer;
}