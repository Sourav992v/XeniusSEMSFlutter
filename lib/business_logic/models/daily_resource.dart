import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'daily_resource.g.dart';

abstract class DailyResource
    implements Built<DailyResource, DailyResourceBuilder> {
  @nullable
  String get date;
  @nullable
  String get dg_unit;
  @nullable
  String get grid_unit;
  @nullable
  double get dg_amt;
  @nullable
  double get grid_amt;

  DailyResource._();

  factory DailyResource([updates(DailyResourceBuilder b)]) = _$DailyResource;

  static Serializer<DailyResource> get serializer => _$dailyResourceSerializer;
}
