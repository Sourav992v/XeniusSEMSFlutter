import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'daily_resource.dart';

part 'daily_report.g.dart';

abstract class DailyReport implements Built<DailyReport, DailyReportBuilder> {
  @nullable
  int get rc;
  @nullable
  String get message;
  @nullable
  BuiltList<DailyResource> get resource;

  DailyReport._();

  factory DailyReport([updates(DailyReportBuilder b)]) = _$DailyReport;

  static Serializer<DailyReport> get serializer => _$dailyReportSerializer;
}
