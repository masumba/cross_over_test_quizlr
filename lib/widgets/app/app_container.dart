import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:cross_over_test_quizlr/constants/app_image.dart';
import 'package:cross_over_test_quizlr/constants/app_string.dart';
import 'package:cross_over_test_quizlr/extensions/string_extension.dart';
import 'package:cross_over_test_quizlr/services/check_internet_service.dart';
import 'package:cross_over_test_quizlr/utils/screen_util.dart';
import 'package:cross_over_test_quizlr/utils/shared_style_util.dart';
import 'package:cross_over_test_quizlr/widgets/app/src/app_container_action.dart';
import 'package:cross_over_test_quizlr/widgets/cards/notice_card.dart';
import 'package:cross_over_test_quizlr/widgets/loading_progress.dart';
import 'package:flutter/material.dart';

/// The root widget for the app.
///
/// `AppContainer` is a stateful widget that manages the main elements of the UI.
/// These elements include the app bar, body, fab, drawer, and bottom navigation bar.
class AppContainer extends StatefulWidget {
  /// The title to be displayed in the app bar.
  final String appBarTitle;

  /// The subtitle to be displayed in the app bar.
  final String? appBarSubTitle;

  /// The main body of the app.
  final Widget containerBody;

  /// The floating action button of the app.
  final Widget? fab;

  /// The bottom navigation bar of the app.
  final Widget? bottomNavBar;

  /// The drawer of the app.
  final Widget? appDrawer;

  /// The bottom part of the app bar.
  final PreferredSizeWidget? appBarBottom;

  /// A boolean value that determines whether the title should be centered.
  final bool centerTitle;

  /// If true, the body of the Scaffold doesn't have to be wrapped in a SingleChildScrollView.
  final bool overrideSingleScrollRoot;

  /// If true, the app is currently in a loading state.
  final bool pageLoading;

  /// If true, an app bar will be shown.
  final bool showAppBar;

  /// If true, the logo of the app will be used.
  final bool useLogo;

  /// If true, a notice will be shown indicating that the app is under development.
  final bool underDevelopment;

  /// A list of actions for a PopupMenuButton in the app bar.
  final List<AppContainerAction>? menuActions;

  /// The position of the floating action button.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// A list of widgets to be displayed at the bottom of the Scaffold.
  final List<Widget>? persistentFooterButtons;

  /// A button to be added in the app bar.
  final Widget? appBarActionButton;

  /// The color of the [Material] widget that underlies the entire Scaffold.
  ///
  /// The theme's [ThemeData.scaffoldBackgroundColor] by default.
  final Color? backgroundColor;

  const AppContainer({
    Key? key,
    required this.containerBody,
    this.appBarTitle = AppString.title,
    this.showAppBar = true,
    this.fab,
    this.appDrawer,
    this.appBarActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavBar,
    this.appBarBottom,
    this.appBarSubTitle,
    this.backgroundColor,
    this.menuActions,
    this.persistentFooterButtons,
    this.centerTitle = false,
    this.useLogo = false,
    this.overrideSingleScrollRoot = false,
    this.pageLoading = false,
    this.underDevelopment = false,
  }) : super(key: key);

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  List<Widget>? actions;
  @override
  void initState() {
    if (CheckInternetService().listener != null) {
      CheckInternetService().listener!.cancel();
    }
    CheckInternetService().checkConnection();

    var menuActions = widget.menuActions;
    if (menuActions != null && menuActions.isNotEmpty) {
      actions = <Widget>[
        PopupMenuButton<String>(
          onSelected: (value) {
            var selectedAction = menuActions
                .firstWhereOrNull((menuItem) => menuItem.reference == value);
            if (selectedAction != null) {
              selectedAction.onClick();
            }
          },
          itemBuilder: (BuildContext context) {
            return menuActions.map((AppContainerAction action) {
              return PopupMenuItem<String>(
                value: action.reference,
                child: Text(action.title),
              );
            }).toList();
          },
        ),
      ];
    }

    var menuActionButton = widget.appBarActionButton;
    if (menuActionButton != null) {
      if (menuActions == null) {
        actions = [menuActionButton];
      } else {
        final actionsList = actions;
        if (actionsList != null) {
          actions = [menuActionButton];
          actionsList.insert(0, menuActionButton);
          actions = actionsList;
        }
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    if (CheckInternetService().listener != null) {
      CheckInternetService().listener!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: widget.showAppBar
          ? AppBar(
              centerTitle: widget.centerTitle,
              elevation: 1,
              bottom: widget.appBarBottom,
              title: widget.useLogo
                  ? Image.asset(
                      AppImage.logo,
                      width: 40,
                      height: 40,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          AppString.title == widget.appBarTitle
                              ? widget.appBarTitle.toUpperCase()
                              : widget.appBarTitle.toUpperCase(),
                          minFontSize: 10,
                          style: SharedStyleUtil.appBarTitleTextStyle.copyWith(
                            color: Theme.of(context)
                                .appBarTheme
                                .titleTextStyle
                                ?.color,
                          ),
                        ),
                        if (widget.appBarSubTitle != null)
                          AutoSizeText(
                            widget.appBarSubTitle?.toTitleCase() ?? '',
                            minFontSize: 4,
                            style: SharedStyleUtil.appBarSubTitleTextStyle
                                .copyWith(
                              color: Theme.of(context)
                                  .appBarTheme
                                  .titleTextStyle
                                  ?.color,
                            ),
                          )
                      ],
                    ),
              //centerTitle: true,
              actions: actions,
            )
          : null,
      body: SafeArea(
        child: widget.overrideSingleScrollRoot
            ? widget.underDevelopment
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil.screenHeight(context) * 0.05),
                    child: NoticeCard(
                      title: widget.appBarTitle,
                      message: 'This feature will be coming soon.',
                    ),
                  )
                : widget.pageLoading
                    ? const LoadingProgress()
                    : widget.containerBody
            : SingleChildScrollView(
                child: widget.underDevelopment
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil.screenHeight(context) * 0.07),
                        child: NoticeCard(
                          title: widget.appBarTitle,
                          message: 'This feature will be coming soon.',
                        ),
                      )
                    : widget.pageLoading
                        ? const LoadingProgress()
                        : Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: widget.containerBody,
                          ),
              ),
      ),
      floatingActionButton: widget.fab,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      drawer: widget.appDrawer,
      persistentFooterButtons: widget.persistentFooterButtons,
      bottomNavigationBar: widget.bottomNavBar,
    );
  }
}
