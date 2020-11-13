import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'coupon_recharge_response.g.dart';

abstract class CouponRechargeResponse
    implements Built<CouponRechargeResponse, CouponRechargeResponseBuilder> {

  @nullable
  int get rc;

  @nullable
  String get message;

  CouponRechargeResponse._();

  factory CouponRechargeResponse([updates(CouponRechargeResponseBuilder b)]) = _$CouponRechargeResponse;

  static Serializer<CouponRechargeResponse> get serializer => _$couponRechargeResponseSerializer;
}