import 'package:flutter/foundation.dart' as foundation;

class AppConfig {
  static const bool appIsLive = foundation.kReleaseMode;
  static const int requestTimeout = 90;

  static const String _appLiveBaseURL =
      "https://cross-platform.rp.devfactory.com";
  static const String _appTestBaseURL =
      "https://cross-platform.rp.devfactory.com";

  static String baseURL() {
    return appIsLive ? _appLiveBaseURL : _appTestBaseURL;
  }
}
