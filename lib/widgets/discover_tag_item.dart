import 'package:cross_over_test_quizlr/models/dto/discover_record_dto.dart';
import 'package:cross_over_test_quizlr/utils/app_data_formatter.dart';
import 'package:cross_over_test_quizlr/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscoverTagItem extends StatelessWidget {
  final List<DiscoverRecordDto> records;
  const DiscoverTagItem({Key? key, required this.records}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: records.length,
      itemBuilder: (BuildContext cxt, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FaIcon(FontAwesomeIcons.hashtag),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(records[index].hashTag),
              subtitle: const Text('Trending Hashtag'),
              trailing: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Material(
                      color: Colors.grey.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppDataFormatter.formatNumber(
                                  records[index].totalItems),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil.screenHeightFraction(context, dividedBy: 3),
              child: _DiscoverItemHeadline(
                headlines: records[index].topItemTitles,
              ),
            ),
            ScreenUtil.spacedDividerSmall,
          ],
        );
      },
    );
  }
}

class _DiscoverItemHeadline extends StatelessWidget {
  final List<String> headlines;
  const _DiscoverItemHeadline({super.key, required this.headlines});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: headlines.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: ScreenUtil.screenWidthFraction(context, dividedBy: 3),
            height: ScreenUtil.screenHeightFraction(context, dividedBy: 4),
            alignment: Alignment.centerLeft,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              headlines[index],
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
