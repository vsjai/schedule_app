// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:schedule_app/views/activity_screen.dart' as _i4;
import 'package:schedule_app/views/homepage.dart' as _i2;
import 'package:schedule_app/views/schedule_screen.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const homePageScreen = '/';

  static const desktopScheduleScreen = '/desktop-schedule-screen';

  static const mobileScheduleScreen = '/mobile-schedule-screen';

  static const activityScreen = '/activity-screen';

  static const all = <String>{
    homePageScreen,
    desktopScheduleScreen,
    mobileScheduleScreen,
    activityScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homePageScreen,
      page: _i2.HomePageScreen,
    ),
    _i1.RouteDef(
      Routes.desktopScheduleScreen,
      page: _i3.DesktopScheduleScreen,
    ),
    _i1.RouteDef(
      Routes.mobileScheduleScreen,
      page: _i3.MobileScheduleScreen,
    ),
    _i1.RouteDef(
      Routes.activityScreen,
      page: _i4.ActivityScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomePageScreen: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomePageScreen(),
        settings: data,
      );
    },
    _i3.DesktopScheduleScreen: (data) {
      final args = data.getArgs<DesktopScheduleScreenArguments>(
        orElse: () => const DesktopScheduleScreenArguments(),
      );
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.DesktopScheduleScreen(key: args.key),
        settings: data,
      );
    },
    _i3.MobileScheduleScreen: (data) {
      final args = data.getArgs<MobileScheduleScreenArguments>(
        orElse: () => const MobileScheduleScreenArguments(),
      );
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.MobileScheduleScreen(key: args.key),
        settings: data,
      );
    },
    _i4.ActivityScreen: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.ActivityScreen(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DesktopScheduleScreenArguments {
  const DesktopScheduleScreenArguments({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant DesktopScheduleScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class MobileScheduleScreenArguments {
  const MobileScheduleScreenArguments({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant MobileScheduleScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToHomePageScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homePageScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDesktopScheduleScreen({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.desktopScheduleScreen,
        arguments: DesktopScheduleScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMobileScheduleScreen({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mobileScheduleScreen,
        arguments: MobileScheduleScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToActivityScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.activityScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomePageScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homePageScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDesktopScheduleScreen({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.desktopScheduleScreen,
        arguments: DesktopScheduleScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMobileScheduleScreen({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.mobileScheduleScreen,
        arguments: MobileScheduleScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithActivityScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.activityScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
