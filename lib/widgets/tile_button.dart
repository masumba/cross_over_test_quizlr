import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? color;
  final String title;
  const TileButton({
    Key? key,
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
          height: 50,
          width: 50,
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
