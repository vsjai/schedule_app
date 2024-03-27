import 'package:schedule_app/service/api_service.dart';
import 'package:schedule_app/service/schedule_service.dart';
import 'package:schedule_app/views/activity_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/homepage.dart';
import '../views/schedule_screen.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomePageScreen, initial: true),
  MaterialRoute(page: DesktopScheduleScreen),
  MaterialRoute(page: MobileScheduleScreen),
  MaterialRoute(page: ActivityScreen)
], dependencies: [
  Singleton(classType: NavigationService),
  Singleton(classType: ApiService),
  LazySingleton(classType: ScheduleService)
])
class App {}
