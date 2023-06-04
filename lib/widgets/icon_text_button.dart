import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final Widget icon;
  final Text? label;
  final VoidCallback onPressed;
  final Color color;
  final Color borderColor;
  final Color splashColor;
  const IconTextButton({
    Key? key,
    required this.icon,
    this.label,
    required this.onPressed,
    this.borderColor = Colors.transparent,
    this.color = Colors.transparent,
    this.splashColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(60, 60),
      child: InkWell(
        splashColor: splashColor,
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor,
                  width: 1.5,
                ),
              ),
              child: ClipOval(
                child: Material(
                  color: color,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: icon,
                  ),
                ),
              ),
            ), // <-- Icon
            if (label != null)
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: label,
              ), // <-- Text
          ],
        ),
      ),
    );
  }
}
