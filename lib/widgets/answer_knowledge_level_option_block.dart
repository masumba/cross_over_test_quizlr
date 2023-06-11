import 'package:cross_over_test_quizlr/models/dto/answer_knowledge_level_dto.dart';
import 'package:cross_over_test_quizlr/widgets/tile_button.dart';
import 'package:flutter/material.dart';

class AnswerKnowledgeLevelOptionBlock extends StatefulWidget {
  final AnswerKnowledgeLevelDto? selectedAnswerLevel;
  final List<AnswerKnowledgeLevelDto> options;
  final Function(AnswerKnowledgeLevelDto) onOptionSelect;
  const AnswerKnowledgeLevelOptionBlock({
    Key? key,
    this.selectedAnswerLevel,
    required this.options,
    required this.onOptionSelect,
  }) : super(key: key);

  @override
  State<AnswerKnowledgeLevelOptionBlock> createState() =>
      _AnswerKnowledgeLevelOptionBlockState();
}

class _AnswerKnowledgeLevelOptionBlockState
    extends State<AnswerKnowledgeLevelOptionBlock> {
  @override
  Widget build(BuildContext context) {
    if (widget.selectedAnswerLevel != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          tileColor: widget.selectedAnswerLevel?.levelColor.withOpacity(0.8),
          title: Text(
            widget.selectedAnswerLevel?.levelName ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      );
    } else {
      // Example list of tile titles

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: widget.options.length,
          itemBuilder: (BuildContext context, int index) {
            return TileButton(
              color: widget.options[index].levelColor,
              title: widget.options[index].levelName,
              onPressed: () {
                widget.onOptionSelect(widget.options[index]);
              },
            );
          },
        ),
      );
    }
  }
}
