import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../states.dart';
import 'custom_input.dart';

class InputWeight extends StatefulWidget {
  const InputWeight({
    super.key,
  });

  @override
  State<InputWeight> createState() => _InputWeightState();
}

class _InputWeightState extends State<InputWeight> {
  String _input = '';

  @override
  Widget build(BuildContext context) {
    Color whichColorBorder = isButtonClickCalculate ? (!_input.isEmpty ? Color(0xFFD9D9D9) : Color(0xFFFF0000)) : Color(0xFFD9D9D9);

    return Row(
      children: [
        Container(
          width: 105.0,
          child: const Text(
            'Масса тела:',
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
                  calculateWeight = text;
                  setState(() {
                    _input = text;
                  });
                },
              ),
              const SizedBox(
                width: 5.0,
              ),
              const Text(
                'кг',
                style: TextStyle(color: gMainColor),
              )
            ],
          ),
        )
      ],
    );
  }
}
