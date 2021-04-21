import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BuyButton extends StatelessWidget {
  final void Function()? onPressed;
  final double width;
  final double height;
  final Widget child;

  const BuyButton({Key? key, this.onPressed, required this.width, required this.height, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.colorScheme.background),
          ),
          onPressed: onPressed,
          child: child),
    );
  }
}
