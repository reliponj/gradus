import 'package:flutter/material.dart';
import 'package:gradus/components/button_orange.dart';
import 'package:gradus/constants.dart';

class AddDrink extends StatelessWidget {
  const AddDrink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Добавить напиток',
            style: TextStyle(
              color: gMainColor,
              fontFamily: gFontRobReg,
            ),
          ),
        ),
        Container(
          width: 200.0,
          child: ButtonOrange(text: 'Добавить', onPressed: () {}),
        )
      ],
    );
  }
}
