import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 20.0, 8.0),
            child: Text(
              'What was the name of the Act that created federal subsidies for the construction of a transcontinental railroad?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
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
