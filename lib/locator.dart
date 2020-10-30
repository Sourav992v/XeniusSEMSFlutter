import 'package:get_it/get_it.dart';
import 'package:xeniusapp/business_logic/services/login_service.dart';
import 'package:xeniusapp/business_logic/viewmodels/comparative_report_viewmodel.dart';
import 'package:xeniusapp/business_logic/viewmodels/current_tariff_viewmodel.dart';
import 'package:xeniusapp/business_logic/viewmodels/daily_report_viewmodel.dart';

import 'business_logic/services/authentication_service.dart';
import 'business_logic/viewmodels/home_viewmodel.dart';
import 'business_logic/viewmodels/login_viewmodel.dart';
import 'business_logic/viewmodels/message_viewmodel.dart';
import 'business_logic/viewmodels/monthly_report_viewmodel.dart';
import 'business_logic/viewmodels/notice_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLoactor() {
  locator.registerLazySingleton(() => AuthenticationService.create());

  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => DailyReportViewModel());
  locator.registerFactory(() => MonthlyReportViewModel());
  locator.registerFactory(() => ComparativeReportViewModel());
  locator.registerFactory(() => CurrentTariffViewModel());
  locator.registerFactory(() => NoticeViewModel());
  locator.registerFactory(() => MessageViewModel());
}
