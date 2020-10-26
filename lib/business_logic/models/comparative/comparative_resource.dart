import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'comparative_resource.g.dart';

abstract class ComparativeResource
    implements Built<ComparativeResource, ComparativeResourceBuilder> {
  @nullable
  String get previous_month;
  @nullable
  String get previous_dg_unit;
  @nullable
  String get previous_grid_unit;
  @nullable
  double get previous_dg_amt;
  @nullable
  double get previous_grid_amt;

  @nullable
  String get current_month;
  @nullable
  String get current_dg_unit;
  @nullable
  String get current_grid_unit;
  @nullable
  double get current_dg_amt;
  @nullable
  double get current_grid_amt;

  ComparativeResource._();

  factory ComparativeResource([updates(ComparativeResourceBuilder b)]) =
      _$ComparativeResource;

  static Serializer<ComparativeResource> get serializer =>
      _$comparativeResourceSerializer;
}
