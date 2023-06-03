import 'package:cross_over_test_quizlr/views/app_base_view_model.dart';

class HomeViewModel extends AppBaseViewModel {
  int selectedTabIndexHomeView = 0;
  Future<void> init() async {}

  void updateIndex(int position) {
    selectedTabIndexHomeView = position;
    notifyListeners();
  }
}
