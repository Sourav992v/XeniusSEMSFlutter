import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'power_control_response.g.dart';

abstract class PowerControlResponse
    implements Built<PowerControlResponse, PowerControlResponseBuilder> {
  @nullable
  int get rc;

  @nullable
  String get message;

  PowerControlResponse._();

  factory PowerControlResponse([updates(PowerControlResponseBuilder b)]) = _$PowerControlResponse;

  static Serializer<PowerControlResponse> get serializer => _$powerControlResponseSerializer;
}