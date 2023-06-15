import 'package:flutter/material.dart';

class TimeTrackTile extends StatelessWidget {
  final String title;
  final String subText;
  final double progressPercentage;
  const TimeTrackTile({
    Key? key,
    required this.title,
    required this.subText,
    this.progressPercentage = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          if (progressPercentage > 0)
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: 300,
                height: 15,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: progressPercentage / 100,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                    backgroundColor: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              subText,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
