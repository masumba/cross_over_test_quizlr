import 'package:cross_over_test_quizlr/views/app_base_view_model.dart';

class StartUpViewModel extends AppBaseViewModel {
  String appVersionNumber = '';
  bool showLoader = true;
  Future<void> init() async {
    try {
      await getAppVersion();
      appVersionNumber = 'Version: $appVersion';
      notifyListeners();
    } catch (e, s) {
      showLoader = false;
      notifyListeners();
      logger.e(e.toString());
      logger.e(s);
    }
  }
}
