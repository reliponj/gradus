import 'package:flutter/material.dart';
import 'package:gradus/components/button_green.dart';
import 'package:gradus/components/button_orange.dart';
import 'package:gradus/helpers/navigator.dart';

import '../../components/wrapper_screens.dart';
import '../../constants.dart';
import '../../states.dart';
import 'components/add_drink.dart';
import 'components/divider_custom.dart';
import 'components/drinking_item.dart';
import 'components/input_height.dart';
import 'components/input_weight.dart';
import 'components/screen_top.dart';
import 'components/switch_hungry.dart';
import 'components/switch_sex.dart';

class ScreenAlcoCalculate extends StatefulWidget {
  const ScreenAlcoCalculate({Key? key}) : super(key: key);

  @override
  State<ScreenAlcoCalculate> createState() => _ScreenAlcoCalculateState();
}

class Drink {
  String percent;
  String ml;

  Drink(this.percent, this.ml);
}

class _ScreenAlcoCalculateState extends State<ScreenAlcoCalculate> {
  bool _isButtonClick = false;
  List<Drink> drinkList = [
    Drink(
      '0',
      '0',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreens(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 60.0, bottom: 40.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ScreenTop(),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  margin: EdgeInsets.only(top: 20.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: gWhiteColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      SwitchSex(),
                      DividerCustom(),
                      InputWeight(),
                      SizedBox(
                        height: 20.0,
                      ),
                      InputHeight(),
                      DividerCustom(),

                      Column(
                        children: drinkList.asMap().entries.map((item) => DrinkItem(numberItem: item.key + 1)).toList(),
                      ),

                      // AddDrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          drinkList.length > 1 ? Container(
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: ButtonOrange(
                              text: 'Убрать',
                              onPressed: () {
                                setState(() {
                                  drinkList.removeLast();
                                });
                              },
                            ),
                          ) : SizedBox(),
                          drinkList.length < 3 ? Container(
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: ButtonGreen(
                              text: 'Добавить',
                              onPressed: () {
                                setState(() {
                                  drinkList.add(
                                      Drink(
                                        '0',
                                        '0'
                                      )
                                  );
                                });
                              },
                            ),
                          ) : SizedBox()
                        ],
                      ),
                      DividerCustom(),
                      SwitchHungry(),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 13,
                ),
                ButtonGreen(
                  text: "Расчитать",
                  onPressed: () {
                    setState(() {
                      isButtonClickCalculate = true;
                    });
                    if (!calculateWeight.isEmpty &&
                        !calculateHeight.isEmpty &&
                        !calculateDrinkPercent1.isEmpty &&
                        !calculateDrinkMl1.isEmpty) {
                      gradusNavigator(context, '/alco-calculate-done');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
