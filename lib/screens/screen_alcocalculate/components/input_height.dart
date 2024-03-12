import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../states.dart';
import 'custom_input.dart';

class InputHeight extends StatefulWidget {
  InputHeight({
    super.key,
  });

  @override
  State<InputHeight> createState() => _InputHeightState();
}

class _InputHeightState extends State<InputHeight> {
  String _input = '';

  @override
  Widget build(BuildContext context) {
    Color whichColorBorder = isButtonClickCalculate
        ? (!_input.isEmpty ? Color(0xFFD9D9D9) : Color(0xFFFF0000))
        : Color(0xFFD9D9D9);

    return Row(
      children: [
        Container(
          width: 105.0,
          child: const Text(
            'Рост:',
            style: TextStyle(
              color: gMainColor,
              fontFamily: gFontRobReg,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              CustomInput(
                width: 124.0,
                border: whichColorBorder,
                onChanged: (text) {
                  calculateHeight = text;
                  setState(() {
                    _input = text;
                  });
                },
              ),
              const SizedBox(
                width: 5.0,
              ),
              const Text(
                'см',
                style: TextStyle(color: gMainColor),
              )
            ],
          ),
        )
      ],
    );
  }
}
