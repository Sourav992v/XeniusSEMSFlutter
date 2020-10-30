import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:xeniusapp/business_logic/models/notice_response/notice_resource.dart';

part 'notice_response.g.dart';

abstract class NoticeResponse implements Built<NoticeResponse, NoticeResponseBuilder> {
  @nullable
  int get rc;
  @nullable
  String get message;

  @nullable
  int get count;

  @nullable
  BuiltList<NoticeResource> get resource;

  NoticeResponse._();

  factory NoticeResponse([updates(NoticeResponseBuilder b)]) = _$NoticeResponse;

  static Serializer<NoticeResponse> get serializer => _$noticeResponseSerializer;
}
