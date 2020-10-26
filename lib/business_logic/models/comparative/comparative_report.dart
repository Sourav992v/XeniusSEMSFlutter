import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'comparative_resource.dart';

part 'comparative_report.g.dart';

abstract class ComparativeReport
    implements Built<ComparativeReport, ComparativeReportBuilder> {
  @nullable
  int get rc;

  @nullable
  String get message;

  @nullable
  ComparativeResource get resource;

  ComparativeReport._();

  factory ComparativeReport([updates(ComparativeReportBuilder b)]) =
      _$ComparativeReport;

  static Serializer<ComparativeReport> get serializer =>
      _$comparativeReportSerializer;
}
