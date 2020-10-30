import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notice_resource.g.dart';

abstract class NoticeResource implements Built<NoticeResource, NoticeResourceBuilder> {

  @nullable
  String get message;

  @nullable
  String get message_url;

  NoticeResource._();

  factory NoticeResource([updates(NoticeResourceBuilder b)]) = _$NoticeResource;

  static Serializer<NoticeResource> get serializer => _$noticeResourceSerializer;
}


