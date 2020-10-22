import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:xeniusapp/business_logic/models/login_resource.dart';

import 'package:xeniusapp/business_logic/models/password_change/password_change_response.dart';
import 'package:xeniusapp/business_logic/models/resource.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  PasswordChangeResponse,
  LoginResource,
  Resource,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
