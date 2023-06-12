import 'package:cross_over_test_quizlr/models/dto/discover_record_dto.dart';
import 'package:cross_over_test_quizlr/views/app_base_view_model.dart';
import 'package:flutter/material.dart';

class DiscoverTabViewModel extends AppBaseViewModel {
  List<DiscoverRecordDto> records = [];
  Future<void> init() async {
    loadDemoData();
  }

  void loadDemoData() {
    records.clear();
    records.add(
      DiscoverRecordDto(
        hashTag: 'us_history',
        totalItems: 22500,
        topItemTitles: [
          'Manifest Destiny is the idea that the US. had',
          'What were the reasons for Westward Expansion?',
          'Which of the following was a motivating factor for settlers in the mid-1800s?',
          'In the time period leading up to the 1835 Texas Revolution, which of the following was not a conflict between the...',
        ],
      ),
    );
    records.add(
      DiscoverRecordDto(
        hashTag: 'history',
        totalItems: 220500,
        topItemTitles: [
          'Why did many Mormons move West in the mid-1800\'s?',
          'Which of the following is not true regarding the Oregon Trail?',
          'Which U.S President is the best known for their commitment to westward expansion?',
          'Who was Sam Houston?',
        ],
      ),
    );
    records.add(
      DiscoverRecordDto(
        hashTag: 'worldhistory',
        totalItems: 17500,
        topItemTitles: [
          'Impact of Total War: Industrial Production',
          'Social and Economic Effects of Five-Year Plan (Negative)',
          'Adolf Hitler',
          'German-Soviet Nonaggression Pact',
        ],
      ),
    );

    notifyListeners();
  }
}
