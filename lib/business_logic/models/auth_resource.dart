import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:xeniusapp/business_logic/models/resource.dart';

part 'auth_resource.g.dart';

abstract class AuthResource
    implements Built<AuthResource, AuthResourceBuilder> {
  @nullable
  int get rc;
  @nullable
  String get message;
  @nullable
  String get application;

  @nullable
  String get app_base_url;

  @nullable
  Resource get resource;

  AuthResource._();

  factory AuthResource([updates(AuthResourceBuilder b)]) = _$AuthResource;

  static Serializer<AuthResource> get serializer => _$authResourceSerializer;
}
