import 'package:auto_size_text/auto_size_text.dart';
import 'package:cross_over_test_quizlr/models/dto/for_you_tab_answer_dto.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForYouTabAnswer extends StatefulWidget {
  final ForYouTabAnswerDto answer;
  final Function(ForYouTabAnswerDto) onClick;
  final bool showAnswerIfCorrect;
  final bool showAnswerStatus;
  const ForYouTabAnswer({
    Key? key,
    required this.answer,
    required this.onClick,
    this.showAnswerIfCorrect = false,
    this.showAnswerStatus = false,
  }) : super(key: key);

  @override
  State<ForYouTabAnswer> createState() => _ForYouTabAnswerState();
}

class _ForYouTabAnswerState extends State<ForYouTabAnswer> {
  Color tileColor = Colors.white30;
  Widget? titleIcon;

  @override
  void initState() {
    if (widget.showAnswerStatus || widget.showAnswerIfCorrect) {
      if (widget.answer.isCorrect) {
        titleIcon = const Icon(Icons.check_circle);
        tileColor = Colors.greenAccent.withOpacity(0.55);
      } else {
        titleIcon = const FaIcon(FontAwesomeIcons.circleXmark);
        tileColor = Colors.redAccent;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          widget.onClick(widget.answer);
        },
        child: ListTile(
          title: AutoSizeText(widget.answer.answer),
          tileColor: tileColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          trailing: titleIcon,
        ),
      ),
    );
  }
}

class ForYouTabAnswerListBlock extends StatelessWidget {
  final List<ForYouTabAnswerDto> answers;
  final ForYouTabAnswerDto? selectedAnswer;
  final bool showCorrectAnswerIfSelected;
  final bool showOnlyCorrectAnswer;
  final Function(ForYouTabAnswerDto) onAnswerClick;
  const ForYouTabAnswerListBlock({
    super.key,
    required this.answers,
    required this.onAnswerClick,
    this.selectedAnswer,
    this.showOnlyCorrectAnswer = false,
    this.showCorrectAnswerIfSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: answers.length,
      itemBuilder: (BuildContext context, int index) {
        return ForYouTabAnswer(
          answer: answers[index],
          showAnswerIfCorrect:
              showIfCorrect(currentIndexIsCorrect: answers[index].isCorrect),
          showAnswerStatus: showAnswerStatus(answerDto: answers[index]),
          onClick: onAnswerClick,
        );
      },
    );
  }

  bool showAnswerStatus({required ForYouTabAnswerDto answerDto}) {
    if (showOnlyCorrectAnswer) {
      return false;
    }
    return selectedAnswer == answerDto;
  }

  bool showIfCorrect({required bool currentIndexIsCorrect}) {
    var selected = selectedAnswer;
    if (selected != null && currentIndexIsCorrect) {
      return currentIndexIsCorrect;
    }
    if (showOnlyCorrectAnswer && currentIndexIsCorrect) {
      return currentIndexIsCorrect;
    }
    return false;
  }
}
