import 'package:cross_over_test_quizlr/utils/screen_util.dart';
import 'package:cross_over_test_quizlr/views/home/tabs/home/home_tab_view_model.dart';
import 'package:cross_over_test_quizlr/views/home/tabs/home/tabs/following_tab.dart';
import 'package:cross_over_test_quizlr/views/home/tabs/home/tabs/for_you_tab.dart';
import 'package:cross_over_test_quizlr/widgets/app/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  @override
  Widget build(BuildContext context) {
    //TODO comeback and finish this
    /*SystemChrome.setSystemUIOverlayStyle(
        Theme.of(context).appBarTheme.systemOverlayStyle);*/
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
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      children: <Widget>[
                        const Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                      child:
                                          FaIcon(FontAwesomeIcons.stopwatch)),
                                  TextSpan(text: '10m'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TabBar(
                            indicatorColor: Theme.of(context).iconTheme.color,
                            labelColor: Theme.of(context).iconTheme.color,
                            labelStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            tabs: const [
                              Tab(
                                icon: Text('Following'),
                              ),
                              Tab(
                                icon: Text('For You'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              // Handle trailing button press
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              FollowingTab(),
              ForYouTab(),
            ],
          ),
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  flex: 1,
                  child: Icon(Icons.video_collection),
                ),
                Expanded(
                  flex: 4,
                  child: Text('Playlist * Unit 5: Period 5: 1844-1877'),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(Icons.chevron_right),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
