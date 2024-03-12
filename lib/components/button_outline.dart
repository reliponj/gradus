import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonOutline extends StatefulWidget {
  const ButtonOutline({Key? key, required this.onPressed, required this.child}) : super(key: key);

  final onPressed;
  final Widget child;

  @override
  State<ButtonOutline> createState() => _ButtonOutlineState();
}

class _ButtonOutlineState extends State<ButtonOutline> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero, foregroundColor: Colors.transparent),
      child: Container(
        width: 265.0,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(width: 1.0, color: gWhiteColor),
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}

