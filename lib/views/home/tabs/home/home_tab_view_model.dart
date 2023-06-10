import 'dart:math';

import 'package:cross_over_test_quizlr/models/dto/for_you_tab_answer_dto.dart';
import 'package:cross_over_test_quizlr/views/app_base_view_model.dart';
import 'package:flutter/material.dart';

class HomeTabViewModel extends AppBaseViewModel {
  bool followingFlipClicked = false;
  bool forYouFlipClicked = false;
  List<ForYouTabAnswerDto> forYouTabAnswers = [];
  ForYouTabAnswerDto? selectedForYouAnswer;
  int forYouValueKey = 1;
  Random random = Random();
  Future<void> init() async {
    loadForYouAnswers();
  }

  void updateFollowingFlipClicked() {
    followingFlipClicked = !followingFlipClicked;
    notifyListeners();
  }

  void updateForYouFlipClicked() {
    forYouFlipClicked = !forYouFlipClicked;
    if (forYouFlipClicked) {
      selectedForYouAnswer = null;
    }
    forYouValueKey = random.nextInt(99999);
    notifyListeners();
  }

  void loadForYouAnswers() {
    forYouTabAnswers.clear();
    forYouTabAnswers.add(
      ForYouTabAnswerDto(answer: 'Pacific Railway Act', isCorrect: true),
    );
    forYouTabAnswers.add(
      ForYouTabAnswerDto(answer: 'Interstate Commerce Act', isCorrect: false),
    );
    forYouTabAnswers.add(
      ForYouTabAnswerDto(answer: 'Homestead Act', isCorrect: false),
    );
    notifyListeners();
  }

  void answerSelectedOnForYou({required ForYouTabAnswerDto answer}) {
    selectedForYouAnswer = answer;
    forYouValueKey = random.nextInt(99999);
    notifyListeners();
  }
}
