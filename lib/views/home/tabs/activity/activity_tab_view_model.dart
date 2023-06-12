import 'package:cross_over_test_quizlr/views/app_base_view_model.dart';

class ActivityTabViewModel extends AppBaseViewModel {
  bool isSwitchActive = false;
  Future<void> init() async {}

  void updateSwitch({required bool result}) {
    isSwitchActive = result;
    notifyListeners();
  }
}
