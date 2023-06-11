import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? color;
  final String title;
  final double height;
  final double width;
  const TileButton({
    Key? key,
    this.width = 50,
    this.height = 50,
    this.onPressed,
    this.color = Colors.black,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: InkWell(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Theme.of(context).iconTheme.color),
          )),
        ),
      ),
    );
  }
}
