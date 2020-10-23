import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'monthly_resource.dart';

part 'monthly_report.g.dart';

abstract class MonthlyReport
    implements Built<MonthlyReport, MonthlyReportBuilder> {
  @nullable
  int get rc;
  @nullable
  String get message;
  @nullable
  BuiltList<MonthlyResource> get resource;

  MonthlyReport._();

  factory MonthlyReport([updates(MonthlyReportBuilder b)]) = _$MonthlyReport;

  static Serializer<MonthlyReport> get serializer => _$monthlyReportSerializer;
}
