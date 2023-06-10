import 'package:auto_size_text/auto_size_text.dart';
import 'package:cross_over_test_quizlr/models/dto/for_you_tab_answer_dto.dart';
import 'package:flutter/material.dart';

class ForYouTabAnswer extends StatelessWidget {
  final String answer;
  const ForYouTabAnswer({Key? key, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: AutoSizeText(answer),
        tileColor: Colors.white30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class ForYouTabAnswerListBlock extends StatelessWidget {
  final List<ForYouTabAnswerDto> answers;
  const ForYouTabAnswerListBlock({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: answers.length,
      itemBuilder: (BuildContext context, int index) {
        return ForYouTabAnswer(
          answer: answers[index].answer,
        );
      },
    );
  }
}
