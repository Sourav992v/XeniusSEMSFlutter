import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:xeniusapp/business_logic/models/daily_report_resource.dart';
import 'package:xeniusapp/business_logic/models/daily_report_response.dart';
import 'package:xeniusapp/business_logic/models/login_resource.dart';
import 'package:xeniusapp/business_logic/models/monthly_report.dart/monthly_report_resource.dart';
import 'package:xeniusapp/business_logic/models/monthly_report.dart/monthly_report_response.dart';
import 'package:xeniusapp/business_logic/models/monthly_report.dart/monthly_dg.dart';
import 'package:xeniusapp/business_logic/models/monthly_report.dart/monthly_grid.dart';
import 'package:xeniusapp/business_logic/models/password_change/password_change_response.dart';
import 'package:xeniusapp/business_logic/models/resource.dart';

import 'dg.dart';
import 'grid.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  PasswordChangeResponse,
  LoginResource,
  Resource,
  DailyReportResponse,
  DailyReportResource,
  Grid,
  Dg,
  MonthlyReportResponse,
  MonthlyReportResource,
  MonthlyGrid,
  MonthlyDG,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
