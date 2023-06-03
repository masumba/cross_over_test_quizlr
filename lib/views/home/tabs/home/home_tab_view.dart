import 'package:cross_over_test_quizlr/views/home/tabs/home/home_tab_view_model.dart';
import 'package:cross_over_test_quizlr/widgets/app/app_container.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeTabViewModel>.reactive(
      disposeViewModel: false,
      onViewModelReady: (model) => model.init(),
      viewModelBuilder: () => HomeTabViewModel(),
      builder: (context, model, child) => Placeholder(
        color: Colors.blue,
      ),
    );
  }
}
