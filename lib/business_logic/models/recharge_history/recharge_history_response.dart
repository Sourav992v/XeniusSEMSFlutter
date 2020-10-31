import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:xeniusapp/business_logic/models/recharge_history/recharge_history_resource.dart';


part 'recharge_history_response.g.dart';

abstract class RechargeHistoryResponse
    implements Built<RechargeHistoryResponse, RechargeHistoryResponseBuilder> {
  @nullable
  int get rc;
  @nullable
  String get message;
  @nullable
  BuiltList<RechargeHistoryResource> get resource;

  RechargeHistoryResponse._();

  factory RechargeHistoryResponse([updates(RechargeHistoryResponseBuilder b)]) = _$RechargeHistoryResponse;

  static Serializer<RechargeHistoryResponse> get serializer => _$rechargeHistoryResponseSerializer;
}
