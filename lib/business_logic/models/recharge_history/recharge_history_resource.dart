import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recharge_history_resource.g.dart';

abstract class RechargeHistoryResource
    implements Built<RechargeHistoryResource, RechargeHistoryResourceBuilder> {
  @nullable
  String get coupon_id;
  @nullable
  String get amount;
  @nullable
  String get recharge_time ;
  @nullable
  String get mode;

  RechargeHistoryResource._();

  factory RechargeHistoryResource([updates(RechargeHistoryResourceBuilder b)]) =
      _$RechargeHistoryResource;

  static Serializer<RechargeHistoryResource> get serializer =>
      _$rechargeHistoryResourceSerializer;
}
