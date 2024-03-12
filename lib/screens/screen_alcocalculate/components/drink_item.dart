import 'package:flutter/material.dart';

import '../../../constants.dart';

class DrinkItem extends StatelessWidget {
  const DrinkItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 105.0,
          child: Text(
            'Напиток №1:',
            style: TextStyle(
              color: gMainColor,
              fontFamily: gFontRobReg,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                padding:
                EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27.0),
                  border: Border.all(
                    width: 1.0,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: gMainColor),
                ),
              ),
              SizedBox(width: 5.0,),
              Text(
                '%',
                style: TextStyle(color: gMainColor),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                padding:
                EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27.0),
                  border: Border.all(
                    width: 1.0,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: gMainColor),
                ),
              ),
              SizedBox(width: 5.0,),
              Text(
                'мл',
                style: TextStyle(color: gMainColor),
              )
            ],
          ),
        )
      ],
    );
  }
}
