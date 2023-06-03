import 'package:cross_over_test_quizlr/views/home/home_view_model.dart';
import 'package:cross_over_test_quizlr/views/home/tabs/activity/activity_tab_view.dart';
import 'package:cross_over_test_quizlr/views/home/tabs/bookmarks/bookmark_tab_view.dart';
import 'package:cross_over_test_quizlr/views/home/tabs/discover/discover_tab_view.dart';
import 'package:cross_over_test_quizlr/views/home/tabs/home/home_tab_view.dart';
import 'package:cross_over_test_quizlr/views/home/tabs/profile/profile_tab_view.dart';
import 'package:cross_over_test_quizlr/widgets/app/app_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> _screens = [
    const HomeTabView(),
    const DiscoverTabView(),
    const ActivityTabView(),
    const BookmarkTabView(),
    const ProfileTabView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (model) => model.init(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => AppContainer(
        showAppBar: false,
        overrideSingleScrollRoot: true,
        containerBody: _screens[model.selectedTabIndexHomeView],
        bottomNavBar: BottomNavigationBar(
          currentIndex: model.selectedTabIndexHomeView,
          onTap: (indexValue) {
            model.updateIndex(indexValue);
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidCompass),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.stopwatch),
              label: "Activity",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidBookmark),
              label: "Bookmarks",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidCircleUser),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
