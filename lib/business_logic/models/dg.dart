import 'dart:ffi';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dg.g.dart';

@JsonSerializable()
abstract class Dg implements Built<Dg, DgBuilder> {
  @JsonKey(name: 'date')
  BuiltList<int> get date;

  @JsonKey(name: 'dg_unit')
  BuiltList<double> get dg_unit;

  @JsonKey(name: 'dg_amt')
  BuiltList<double> get dg_amt;

  Dg._();

  factory Dg([updates(DgBuilder b)]) = _$Dg;

  static Serializer<Dg> get serializer => _$dgSerializer;
}
