import 'package:flutter/material.dart';
import 'package:schedule_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final navigationService = NavigationService();
  navigateToScheduleScreen(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      navigationService.navigateTo(Routes.desktopScheduleScreen);
    } else {
      navigationService.navigateTo(Routes.mobileScheduleScreen);
    }
  }

  navigateToActivityScreen() {
    navigationService.navigateTo(Routes.activityScreen);
  }
}
