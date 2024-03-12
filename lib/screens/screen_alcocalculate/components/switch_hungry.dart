import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../states.dart';

class SwitchHungry extends StatefulWidget {
  const SwitchHungry({
    super.key,
  });

  @override
  State<SwitchHungry> createState() => _SwitchHungryState();
}

class _SwitchHungryState extends State<SwitchHungry> {
  bool _hungry = false;

  @override
  Widget build(BuildContext context) {
    calculateStomach = _hungry;

    return Row(
      children: [
        Container(
          width: 105.0,
          child: Text(
            'Желудок:',
            style: TextStyle(
              color: gMainColor,
              fontFamily: gFontRobReg,
            ),
          ),
        ),
        Container(
          height: 24.0,
          child: TextButton(
            onPressed: () {
              setState(() {
                _hungry = false;
              });
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: gWhiteColor,
            ),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFFCCCCCC),
                          ),
                          borderRadius: BorderRadius.circular(100.0)),
                    ),
                    !_hungry
                        ? Positioned(
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          color: gGreenColor,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    )
                        : SizedBox(),
                  ],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Пустой',
                  style: TextStyle(
                    color: gMainColor,
                    fontFamily: gFontRobReg,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 33.0,
        ),
        Container(
          height: 24.0,
          child: TextButton(
            onPressed: () {
              setState(() {
                _hungry = true;
              });
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: gWhiteColor,
            ),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFFCCCCCC),
                          ),
                          borderRadius: BorderRadius.circular(100.0)),
                    ),
                    _hungry
                        ? Positioned(
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          color: gGreenColor,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    )
                        : SizedBox(),
                  ],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Полный',
                  style: TextStyle(
                    color: gMainColor,
                    fontFamily: gFontRobReg,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
