import 'package:flutter/material.dart';
import '../../../constants.dart';

class ButtonOrange extends StatefulWidget {
  ButtonOrange({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final onPressed;
  final String text;

  @override
  State<ButtonOrange> createState() => _ButtonOrangeState();
}

class _ButtonOrangeState extends State<ButtonOrange> {
  bool _buttonHover = false;

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
          color: gOrangeColor,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(width: 1.0, color: gWhiteColor),
        ),
        child: Center(
          child: Text(
            widget.text.toUpperCase(),
            style: const TextStyle(
              color: gWhiteColor,
              fontFamily: gFontNunBlack,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
