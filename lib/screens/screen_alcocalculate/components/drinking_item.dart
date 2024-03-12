import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../states.dart';
import 'custom_input.dart';

class DrinkItem extends StatefulWidget {
  const DrinkItem({
    super.key,
    this.numberItem,
  });

  final numberItem;

  @override
  State<DrinkItem> createState() => _DrinkItemState();
}

class _DrinkItemState extends State<DrinkItem> {
  String _inputForPercent = '';
  String _inputForLitres = '';

  @override
  Widget build(BuildContext context) {
    Color whichColorBorder = isButtonClickCalculate
        ? (!_inputForPercent.isEmpty ? Color(0xFFD9D9D9) : Color(0xFFFF0000))
        : Color(0xFFD9D9D9);
    Color whichColorBorder1 = isButtonClickCalculate
        ? (!_inputForLitres.isEmpty ? Color(0xFFD9D9D9) : Color(0xFFFF0000))
        : Color(0xFFD9D9D9);

    print(widget.numberItem == 1);

    return Container(

      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Container(
            width: 105.0,
            child: Text(
              'Напиток №${widget.numberItem}:',
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
                  width: MediaQuery.of(context).size.width / 5,
                  border: widget.numberItem == 1 ? whichColorBorder : null,
                  onChanged: (text) {
                    if (widget.numberItem == 1) {
                      calculateDrinkPercent1 = text;
                      setState(() {
                        _inputForPercent = text;
                      });
                    } else if (widget.numberItem == 2) {
                      calculateDrinkPercent2 = text;
                    } else if (widget.numberItem == 3) {
                      calculateDrinkPercent3 = text;
                    }
                  },
                ),
                SizedBox(
                  width: 5.0,
                ),
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
                CustomInput(
                  width: MediaQuery.of(context).size.width / 5,
                  border: widget.numberItem == 1 ? whichColorBorder1 : null,
                  onChanged: (text) {
                    if (widget.numberItem == 1) {
                      calculateDrinkMl1 = text;
                      setState(() {
                        _inputForLitres = text;
                      });
                    } else if (widget.numberItem == 2) {
                      calculateDrinkMl2 = text;
                    } else if (widget.numberItem == 3) {
                      calculateDrinkMl3 = text;
                    }
                  },
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width - 300,
                //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(27.0),
                //     border: Border.all(
                //       width: 1.0,
                //       color: Color(0xFFD9D9D9),
                //     ),
                //   ),
                //   child: TextField(
                //     onChanged: (text) {
                //       if (numberItem == 1) {
                //         calculateDrinkMl1 = text;
                //       } else if (numberItem == 2) {
                //         calculateDrinkMl2 = text;
                //       } else if (numberItem == 3) {
                //         calculateDrinkMl3 = text;
                //       }
                //     },
                //     decoration: InputDecoration(
                //       border: InputBorder.none,
                //     ),
                //     style: TextStyle(color: gMainColor),
                //   ),
                // ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'мл',
                  style: TextStyle(color: gMainColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
