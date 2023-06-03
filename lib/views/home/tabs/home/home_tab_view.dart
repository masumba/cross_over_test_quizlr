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
      builder: (context, model, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Material(
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(child: Container()),
                    const TabBar(
                      tabs: [
                        Tab(
                          icon: Text('Following'),
                        ),
                        Tab(
                          icon: Text('For You'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }
}
