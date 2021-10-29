import 'package:flutter/material.dart';
import 'package:trove/constants/styles.dart';

class RoundedButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;

  const RoundedButton(
      {this.onPressed,
      this.child,
      this.width,
      this.height,
      this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: color ?? kGreen,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width ?? double.infinity,
          height: height ?? 58,
          child: child,
        ),
      ),
    );
  }
}
