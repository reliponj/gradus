import 'package:flutter/material.dart';
import 'package:gradus/constants.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: gFontRobReg,
            fontSize: 14.0,
            color: gMainColor.withOpacity(0.5),
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontFamily: gFontNunBold, fontSize: 20.0, color: gMainColor),
        ),
      ],
    );
  }
}
