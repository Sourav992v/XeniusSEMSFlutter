import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'monthly_resource.g.dart';

abstract class MonthlyResource
    implements Built<MonthlyResource, MonthlyResourceBuilder> {
  @nullable
  String get month;
  @nullable
  String get dg_unit;
  @nullable
  String get grid_unit;
  @nullable
  double get dg_amt;
  @nullable
  double get grid_amt;

  MonthlyResource._();

  factory MonthlyResource([updates(MonthlyResourceBuilder b)]) =
      _$MonthlyResource;

  static Serializer<MonthlyResource> get serializer =>
      _$monthlyResourceSerializer;
}
