import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'message_resource.g.dart';

abstract class MessageResource implements Built<MessageResource, MessageResourceBuilder> {

  @nullable
  String get Date;

  @nullable
  String get source;

  @nullable
  String get start_time;

  @nullable
  String get end_time;

  MessageResource._();

  factory MessageResource([updates(MessageResourceBuilder b)]) = _$MessageResource;

  static Serializer<MessageResource> get serializer => _$messageResourceSerializer;
}