import 'package:cross_over_test_quizlr/utils/screen_util.dart';
import 'package:cross_over_test_quizlr/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Scaffold(
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
        child: Column(
          children: [
            ListTile(
              leading: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1.5),
                    ),
                    child: ClipOval(
                      child: Material(
                        color: Colors.grey.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FaIcon(FontAwesomeIcons.hashtag),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              title: Text('us_history'),
              subtitle: Text('Trending Hashtag'),
              trailing: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Material(
                      color: Colors.grey.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('22.5K'),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: ScreenUtil.screenWidthFraction(context, dividedBy: 3),
                height: ScreenUtil.screenHeightFraction(context, dividedBy: 4),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'This is some text',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            ScreenUtil.spacedDividerSmall,
          ],
        ),
      ),
    );
  }
}
