import 'package:cross_over_test_quizlr/utils/screen_util.dart';
import 'package:cross_over_test_quizlr/views/home/tabs/discover/discover_tab_view_model.dart';
import 'package:cross_over_test_quizlr/widgets/discover_tag_item.dart';
import 'package:cross_over_test_quizlr/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class DiscoverTabView extends StatefulWidget {
  const DiscoverTabView({super.key});

  @override
  State<DiscoverTabView> createState() => _DiscoverTabViewState();
}

class _DiscoverTabViewState extends State<DiscoverTabView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey.shade800,
    ));
    return ViewModelBuilder<DiscoverTabViewModel>.reactive(
      onViewModelReady: (model) => model.init(),
      viewModelBuilder: () => DiscoverTabViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade800,
          title: InputField(
            inputFieldColor: Colors.blueGrey.shade700,
            smallVersion: true,
            prefixIcon: const Icon(Icons.search),
            controller: null,
            placeholder: 'Search',
            suffixIcon: const Icon(Icons.mic),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DiscoverTagItem(
            records: model.records,
          ),
        ),
      ),
    );
  }
}
