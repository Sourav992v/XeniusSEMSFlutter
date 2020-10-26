import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'current_applicable_resource.g.dart';

abstract class CurrentApplicableResource
    implements
        Built<CurrentApplicableResource, CurrentApplicableResourceBuilder> {
  @nullable
  String get heading;
  @nullable
  String get content;
  CurrentApplicableResource._();

  factory CurrentApplicableResource(
          [updates(CurrentApplicableResourceBuilder b)]) =
      _$CurrentApplicableResource;

  static Serializer<CurrentApplicableResource> get serializer =>
      _$currentApplicableResourceSerializer;
}
