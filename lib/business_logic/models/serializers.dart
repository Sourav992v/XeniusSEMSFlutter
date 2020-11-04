import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:xeniusapp/business_logic/models/auth_resource.dart';
import 'package:xeniusapp/business_logic/models/comparative/comparative_report.dart';
import 'package:xeniusapp/business_logic/models/comparative/comparative_resource.dart';
import 'package:xeniusapp/business_logic/models/coupon_recharge_response.dart';
import 'package:xeniusapp/business_logic/models/current_applicable_rates/current_applicable_resource.dart';
import 'package:xeniusapp/business_logic/models/current_applicable_rates/current_applicable_response.dart';
import 'package:xeniusapp/business_logic/models/daily_report.dart';
import 'package:xeniusapp/business_logic/models/daily_resource.dart';
import 'package:xeniusapp/business_logic/models/forgot_password/auth_otp_response.dart';
import 'package:xeniusapp/business_logic/models/forgot_password/forgot_password_response.dart';
import 'package:xeniusapp/business_logic/models/forgot_password/password_reset_response.dart';
import 'package:xeniusapp/business_logic/models/forgot_password/resend_otp_response.dart';


import 'package:xeniusapp/business_logic/models/login_resource.dart';
import 'package:xeniusapp/business_logic/models/message_response/message_resource.dart';
import 'package:xeniusapp/business_logic/models/message_response/message_response.dart';
import 'package:xeniusapp/business_logic/models/monthly_report.dart/monthly_report.dart';
import 'package:xeniusapp/business_logic/models/monthly_report.dart/monthly_resource.dart';
import 'package:xeniusapp/business_logic/models/notice_response/notice_resource.dart';
import 'package:xeniusapp/business_logic/models/notice_response/notice_response.dart';

import 'package:xeniusapp/business_logic/models/password_change/password_change_response.dart';
import 'package:xeniusapp/business_logic/models/power_control_response.dart';
import 'package:xeniusapp/business_logic/models/recharge_history/recharge_history_resource.dart';
import 'package:xeniusapp/business_logic/models/recharge_history/recharge_history_response.dart';
import 'package:xeniusapp/business_logic/models/remove_firebase_token_response.dart';
import 'package:xeniusapp/business_logic/models/resource.dart';
import 'package:xeniusapp/business_logic/models/set_config_response.dart';

import 'login_count_response.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AuthResource,
  LoginCountResponse,
  PasswordChangeResponse,
  LoginResource,
  Resource,
  DailyReport,
  DailyResource,
  MonthlyReport,
  MonthlyReport,
  ComparativeReport,
  ComparativeResource,
  CurrentApplicableResponse,
  CurrentApplicableResource,
  NoticeResponse,
  NoticeResource,
  MessageResponse,
  MessageResource,
  RechargeHistoryResponse,
  RechargeHistoryResource,
  SetConfigResponse,
  CouponRechargeResponse,
  RemoveFirebaseTokenResponse,
  PowerControlResponse,
  ForgotPasswordResponse,
  AuthOTPResponse,
  ResendOTPResponse,
  PasswordResetResponse
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
