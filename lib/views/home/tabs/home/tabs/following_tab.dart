import 'package:cross_over_test_quizlr/widgets/icon_text_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FollowingTab extends StatefulWidget {
  const FollowingTab({super.key});

  @override
  State<FollowingTab> createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 60.0, 8.0),
            child: Text(
              'What was the name of the Act that created federal subsidies for the construction of a transcontinental railroad?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        Positioned(
          right: 8,
          top: MediaQuery.of(context).size.height * 0.28,
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
                  // Handle trailing button press
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
            children: const [
              Text(
                'AP US History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Topic 5.2: Manifest Destiny #apush5_1',
                style: TextStyle(
                  color: Colors.white,
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
