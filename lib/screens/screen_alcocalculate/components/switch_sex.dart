import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../states.dart';

class SwitchSex extends StatefulWidget {
  const SwitchSex({
    super.key,
  });

  @override
  State<SwitchSex> createState() => _SwitchSexState();
}

class _SwitchSexState extends State<SwitchSex> {
  bool _sex = false;

  @override
  Widget build(BuildContext context) {
    calculateSex = _sex;

    return Row(
      children: [
        Container(
          width: 105.0,
          child: const Text(
            'Пол:',
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
                _sex = false;
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
                            color: const Color(0xFFCCCCCC),
                          ),
                          borderRadius: BorderRadius.circular(100.0)),
                    ),
                    !_sex
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
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
                const Text(
                  'Мужской',
                  style: TextStyle(
                    color: gMainColor,
                    fontFamily: gFontRobReg,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 33.0,
        ),
        Container(
          height: 24.0,
          child: TextButton(
            onPressed: () {
              setState(() {
                _sex = true;
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
                            color: const Color(0xFFCCCCCC),
                          ),
                          borderRadius: BorderRadius.circular(100.0)),
                    ),
                    _sex
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
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
                const Text(
                  'Женский',
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
