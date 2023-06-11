import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class IconTextButton extends StatefulWidget {
  final Widget icon;
  final Widget? badgeIcon;
  final Text? label;
  final VoidCallback onPressed;
  final Color color;
  final Color borderColor;
  final Color splashColor;
  final Color badgeColor;
  const IconTextButton({
    Key? key,
    required this.icon,
    this.badgeColor = Colors.transparent,
    this.badgeIcon,
    this.label,
    required this.onPressed,
    this.borderColor = Colors.transparent,
    this.color = Colors.transparent,
    this.splashColor = Colors.transparent,
  }) : super(key: key);

  @override
  State<IconTextButton> createState() => _IconTextButtonState();
}

class _IconTextButtonState extends State<IconTextButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(60, 60),
      child: InkWell(
        splashColor: widget.splashColor,
        onTap: widget.onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            badges.Badge(
              position: badges.BadgePosition.bottomEnd(bottom: -12, end: 0),
              badgeContent: widget.badgeIcon,
              badgeStyle: badges.BadgeStyle(badgeColor: widget.badgeColor),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.borderColor,
                    width: 1.5,
                  ),
                ),
                child: ClipOval(
                  child: Material(
                    color: widget.color,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: widget.icon,
                    ),
                  ),
                ),
              ),
            ), // <-- Icon
            if (widget.label != null)
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: widget.label,
              ), // <-- Text
          ],
        ),
      ),
    );
  }
}
