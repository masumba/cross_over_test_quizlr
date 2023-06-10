import 'package:cross_over_test_quizlr/views/app_base_view_model.dart';
import 'package:flutter/material.dart';

class HomeTabViewModel extends AppBaseViewModel {
  bool followingFlipClicked = false;
  Future<void> init() async {}

  void updateFollowingFlipClicked() {
    followingFlipClicked = !followingFlipClicked;
    notifyListeners();
  }
}
