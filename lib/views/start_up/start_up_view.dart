import 'package:cross_over_test_quizlr/constants/app_string.dart';
import 'package:cross_over_test_quizlr/views/start_up/start_up_view_model.dart';
import 'package:cross_over_test_quizlr/widgets/app/app_container.dart';
import 'package:cross_over_test_quizlr/widgets/loading_progress.dart';
import 'package:cross_over_test_quizlr/widgets/text_logo.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatefulWidget {
  const StartUpView({super.key});

  @override
  State<StartUpView> createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onViewModelReady: (model) => model.init(),
      viewModelBuilder: () => StartUpViewModel(),
      builder: (context, model, child) => AppContainer(
        showAppBar: false,
        overrideSingleScrollRoot: true,
        containerBody: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              flex: 4,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextLogo(
                    text: AppString.title,
                  ),
                ),
              ),
            ),
            model.showLoader
                ? const Expanded(
                    flex: 2,
                    child: LoadingProgress(),
                  )
                : Expanded(
                    flex: 0,
                    child: Container(
                      height: 0,
                    ),
                  ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  model.appVersionNumber,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
