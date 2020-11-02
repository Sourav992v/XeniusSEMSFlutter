import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:xeniusapp/business_logic/models/resource.dart';

part 'login_count_response.g.dart';

abstract class LoginCountResponse
    implements Built<LoginCountResponse, LoginCountResponseBuilder> {
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

  LoginCountResponse._();

  factory LoginCountResponse([updates(LoginCountResponseBuilder b)]) = _$LoginCountResponse;

  static Serializer<LoginCountResponse> get serializer => _$loginCountResponseSerializer;
}
