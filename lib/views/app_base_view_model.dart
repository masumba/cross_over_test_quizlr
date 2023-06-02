import 'package:cross_over_test_quizlr/service_locator.dart';
import 'package:cross_over_test_quizlr/services/navigation_service.dart';
import 'package:cross_over_test_quizlr/services/package_info_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AppBaseViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();
  final PackageInfoService _packageInfoService = locator<PackageInfoService>();
  final Logger logger = Logger();
  String appVersion = '1.0.0';

  Future<void> getAppVersion() async {
    await _packageInfoService.getAppPackageInfo();
    appVersion =
        '${_packageInfoService.appVersion}.${_packageInfoService.buildVersion}';
    notifyListeners();
  }
}
