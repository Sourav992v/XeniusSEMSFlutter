import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'current_applicable_resource.dart';
part 'current_applicable_response.g.dart';

abstract class CurrentApplicableResponse
    implements
        Built<CurrentApplicableResponse, CurrentApplicableResponseBuilder> {
  @nullable
  int get rc;

  @nullable
  String get message;

  @nullable
  BuiltList<CurrentApplicableResource> get resource;

  CurrentApplicableResponse._();

  factory CurrentApplicableResponse(
          [updates(CurrentApplicableResponseBuilder b)]) =
      _$CurrentApplicableResponse;

  static Serializer<CurrentApplicableResponse> get serializer =>
      _$currentApplicableResponseSerializer;
}
