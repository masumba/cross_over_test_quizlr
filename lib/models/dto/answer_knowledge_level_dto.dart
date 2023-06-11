import 'package:flutter/material.dart';

class AnswerKnowledgeLevelDto {
  String levelName;
  Color levelColor;

  AnswerKnowledgeLevelDto({required this.levelName, required this.levelColor});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerKnowledgeLevelDto &&
          runtimeType == other.runtimeType &&
          levelName == other.levelName &&
          levelColor == other.levelColor;

  @override
  int get hashCode => levelName.hashCode ^ levelColor.hashCode;

  @override
  String toString() {
    return 'AnswerKnowledgeLevelDto{levelName: $levelName, levelColor: $levelColor}';
  }
}
