import 'package:cross_over_test_quizlr/views/home/tabs/activity/activity_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        body: Padding(
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
              Text(
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
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
