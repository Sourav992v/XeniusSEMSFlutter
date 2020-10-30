import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'message_resource.dart';

part 'message_response.g.dart';

abstract class MessageResponse implements Built<MessageResponse, MessageResponseBuilder> {
  @nullable
  int get rc;
  @nullable
  String get message;

  @nullable
  BuiltList<MessageResource> get resource;

  MessageResponse._();

  factory MessageResponse([updates(MessageResponseBuilder b)]) = _$MessageResponse;

  static Serializer<MessageResponse> get serializer => _$messageResponseSerializer;
}