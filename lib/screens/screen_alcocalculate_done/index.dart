import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/button_outline.dart';
import '../../components/wrapper_screens.dart';
import '../../states.dart';
import 'components/alco_white_info.dart';
import 'components/screen_top.dart';
import '../../constants.dart';

class ScreenAlcoCalculateDone extends StatelessWidget {
  const ScreenAlcoCalculateDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double weight = double.parse(calculateWeight);
    double sex = calculateSex ? 0.6 : 0.7;

    double drink1 = double.parse(calculateDrinkMl1);
    double percent1 = double.parse(calculateDrinkPercent1);
    double drink2 = double.parse(calculateDrinkMl2);
    double percent2 = double.parse(calculateDrinkPercent2);
    double drink3 = double.parse(calculateDrinkMl3);
    double percent3 = double.parse(calculateDrinkPercent3);

    calculateSum = ((drink1+drink2+drink3) * (percent1+percent2+percent3) * 0.789) / (weight * sex);


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
                const ScreenTop(),
                AlcoWhiteInfo(
                  summary: calculateSum.toStringAsFixed(2),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  width: 350.0,
                  child: Text(
                    'это ориентировочная информация для ознакомления на основании приблизительных расчётов, её нельзя использовать как доказательство при спорах, медицинских заключениях, мы не несём ответственности за её использование',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: gFontRobReg, height: 1.5),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30,),
                ButtonOutline(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/arrow-back-button.svg'),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'вернуться'.toUpperCase(),
                        style: const TextStyle(
                          fontFamily: gFontNunBold,
                          fontSize: 16.0,
                          color: gWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
