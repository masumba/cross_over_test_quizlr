import 'package:cross_over_test_quizlr/constants/app_color.dart';
import 'package:cross_over_test_quizlr/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            AppColor.primaryColor.toColor(),
          ),
        ),
      ),
    );
  }
}
