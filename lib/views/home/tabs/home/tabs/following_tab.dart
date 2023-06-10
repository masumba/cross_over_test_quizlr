import 'package:cross_over_test_quizlr/utils/screen_util.dart';
import 'package:cross_over_test_quizlr/views/home/tabs/home/home_tab_view_model.dart';
import 'package:cross_over_test_quizlr/widgets/busy_button.dart';
import 'package:cross_over_test_quizlr/widgets/icon_text_button.dart';
import 'package:cross_over_test_quizlr/widgets/tile_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class FollowingTab extends StatefulWidget {
  const FollowingTab({super.key});

  @override
  State<FollowingTab> createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab> {
  @override
  Widget build(BuildContext context) {
    var model = getParentViewModel<HomeTabViewModel>(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 65.0, 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'What was the name of the Act that created federal subsidies for the construction of a transcontinental railroad?',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              if (model.followingFlipClicked)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScreenUtil.spacedDivider,
                    const Text(
                      'Answer',
                      style: TextStyle(color: Colors.greenAccent),
                    ),
                    Text(
                      'With the rapid settlement in western territories, Congress decided that an efficient railroad transport to the pacific coast would be beneficial and passed the Pacific Railway Act of 1862 during the Civil War to promote easier western transportation for the North.',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    ScreenUtil.verticalSpaceNormal,
                    const Text('How well did you know this?'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          TileButton(
                            color: Colors.orange,
                            title: '1',
                          ),
                          TileButton(
                            color: Colors.orangeAccent,
                            title: '2',
                          ),
                          TileButton(
                            color: Colors.yellow,
                            title: '3',
                          ),
                          TileButton(
                            color: Colors.green,
                            title: '4',
                          ),
                          TileButton(
                            color: Colors.lightGreen,
                            title: '5',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
        Positioned(
          right: 8,
          top: MediaQuery.of(context).size.height * 0.20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconTextButton(
                icon: const FaIcon(FontAwesomeIcons.scroll),
                color: Colors.amber.withOpacity(0.4),
                borderColor: Colors.white,
                onPressed: () {},
              ),
              IconTextButton(
                icon: const FaIcon(FontAwesomeIcons.solidHeart),
                label: const Text('87'),
                onPressed: () {
                  // Handle trailing button press
                },
              ),
              IconTextButton(
                icon: const FaIcon(FontAwesomeIcons.solidCommentDots),
                label: const Text('2'),
                onPressed: () {
                  // Handle trailing button press
                },
              ),
              IconTextButton(
                icon: const FaIcon(FontAwesomeIcons.share),
                label: const Text('17'),
                onPressed: () {
                  // Handle trailing button press
                },
              ),
              IconTextButton(
                icon: const Icon(Icons.bookmark),
                label: const Text('203'),
                onPressed: () {
                  // Handle trailing button press
                },
              ),
              IconTextButton(
                icon: const Icon(Icons.sync),
                color: Colors.greenAccent,
                label: const Text('Flip'),
                onPressed: () {
                  model.updateFollowingFlipClicked();
                },
              ),
            ],
          ),
        ),
        Positioned(
          left: 8,
          bottom: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AP US History',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Topic 5.2: Manifest Destiny #apush5_1',
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
