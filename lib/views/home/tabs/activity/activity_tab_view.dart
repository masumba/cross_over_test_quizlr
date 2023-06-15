import 'package:auto_size_text/auto_size_text.dart';
import 'package:cross_over_test_quizlr/utils/screen_util.dart';
import 'package:cross_over_test_quizlr/views/home/tabs/activity/activity_tab_view_model.dart';
import 'package:cross_over_test_quizlr/widgets/busy_button.dart';
import 'package:cross_over_test_quizlr/widgets/charts/bar_chart_sample2.dart';
import 'package:cross_over_test_quizlr/widgets/time_track_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class ActivityTabView extends StatefulWidget {
  const ActivityTabView({super.key});

  @override
  State<ActivityTabView> createState() => _ActivityTabViewState();
}

class _ActivityTabViewState extends State<ActivityTabView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey.shade800,
    ));
    return ViewModelBuilder<ActivityTabViewModel>.reactive(
      onViewModelReady: (model) => model.init(),
      viewModelBuilder: () => ActivityTabViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade800,
          title: const Text('Activity'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    tileColor: Colors.blueGrey.shade700,
                    title: const Text(
                      'Screen Time Management',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Limit time spent in fun apps (TikTok,Games...) to be the same amount spent learning in Quizlr.',
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    trailing: CupertinoSwitch(
                        // overrides the default green color of the track
                        activeColor: Colors.green,
                        // color of the round icon, which moves from right to left
                        thumbColor: Colors.white,
                        // when the switch is off
                        trackColor: Colors.black12,
                        // boolean variable value
                        value: model.isSwitchActive,
                        // changes the state of the switch
                        onChanged: (value) {
                          model.updateSwitch(result: value);
                        }),
                  ),
                ),
                Text(
                  '10m',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'This is the time that you have left for fun apps of your weekly allowance. It is calculated by subtracting the time spent in fun app (e.g. TikTok, Instagram...) from the time spent learning.',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    tileColor: Colors.blueGrey.shade700,
                    leading: const Icon(Icons.calendar_month),
                    title: const Text(
                      'Week',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Apr 24, 2023 - Apr 30,2023',
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    trailing: const Icon(Icons.arrow_drop_down),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: ScreenUtil.screenHeightFraction(
                              context,
                              dividedBy: 2,
                            ),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: const AutoSizeText(
                                    'Choose week',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(Icons.close_outlined),
                                  ),
                                ),
                                ScreenUtil.spacedDividerSmall,
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: 20,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        DateTime now = DateTime.now();
                                        DateTime startOfWeek = now.subtract(
                                            Duration(
                                                days: now.weekday -
                                                    1 +
                                                    7 * (10 - index)));
                                        DateTime endOfWeek = startOfWeek
                                            .add(const Duration(days: 6));

                                        final formatter =
                                            DateFormat('MMM d, yyyy');
                                        String formattedStartOfWeek =
                                            formatter.format(startOfWeek);
                                        String formattedEndOfWeek =
                                            formatter.format(endOfWeek);

                                        return ListTile(
                                          title: Text(
                                            '$formattedStartOfWeek - $formattedEndOfWeek',
                                            textAlign: TextAlign.center,
                                          ),
                                          onTap: () {
                                            print(
                                                'Week $index selected: $formattedStartOfWeek - $formattedEndOfWeek');
                                            Navigator.pop(context);
                                          },
                                        );
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: BusyButton(
                                      enabledButtonColor: Colors.green,
                                      title: 'Done',
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        ScreenUtil.screenHeightFraction(context, dividedBy: 1),
                    maxHeight:
                        ScreenUtil.screenHeightFraction(context, dividedBy: 1) *
                            1.5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TabBar(
                            indicatorColor: Theme.of(context).iconTheme.color,
                            labelColor: Theme.of(context).iconTheme.color,
                            labelStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            tabs: const [
                              Tab(text: "Time Spent"),
                              Tab(text: "Apps Opened"),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height:
                                              ScreenUtil.screenHeightFraction(
                                            context,
                                            dividedBy: 2,
                                          ),
                                          child: BarChartSample2(),
                                        ),
                                        const TimeTrackTile(
                                          title: 'Total Time Learning',
                                          progressPercentage: 40.0,
                                          subText: '1h 20m',
                                        ),
                                        const TimeTrackTile(
                                          title: 'Total Time in fun Apps',
                                          progressPercentage: 30.0,
                                          subText: '1h 10m',
                                        ),
                                        const TimeTrackTile(
                                          title: 'Total Allowance Remaining',
                                          progressPercentage: 0.0,
                                          subText: '0h 10m',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height:
                                              ScreenUtil.screenHeightFraction(
                                            context,
                                            dividedBy: 2,
                                          ),
                                          child: BarChartSample2(),
                                        ),
                                        const TimeTrackTile(
                                          title: 'Opened Qiuizlr',
                                          progressPercentage: 0,
                                          subText: '7 times',
                                        ),
                                        const TimeTrackTile(
                                          title: 'Opened Fun Apps',
                                          progressPercentage: 0,
                                          subText: '7 times',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
