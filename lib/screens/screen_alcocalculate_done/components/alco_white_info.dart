import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class AlcoWhiteInfo extends StatelessWidget {
  const AlcoWhiteInfo({
    super.key, this.summary,
  });

  final summary;

  wichIcon() {
    if(double.parse(summary) <= 0.29) {
      return 'assets/icons/alco-test-1.svg';
    } else if(double.parse(summary) >= 0.3 && double.parse(summary) <= 0.9) {
      return 'assets/icons/alco-test-2.svg';
    } else if(double.parse(summary) >= 1.0 && double.parse(summary) <= 1.9) {
      return 'assets/icons/alco-test-3.svg';
    } else if(double.parse(summary) >= 2.0 && double.parse(summary) <= 3.9) {
      return 'assets/icons/alco-test-4.svg';
    } else if(double.parse(summary) >= 4.0 && double.parse(summary) <= 4.9) {
      return 'assets/icons/alco-test-5.svg';
    } else if(double.parse(summary) >= 5.0) {
      return 'assets/icons/alco-test-6.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width - 60,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: gWhiteColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          SvgPicture.asset(wichIcon()),
          const SizedBox(
            height: 40.0,
          ),
          const Text(
            'Максимальная концентрация',
            style: TextStyle(
                fontFamily: gFontRobReg,
                fontSize: 20.0,
                color: gMainColor),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            '$summary‰',
            style: TextStyle(
                fontSize: 36.0,
                fontFamily: gFontNunBlack,
                color: gMainColor),
          ),
          const SizedBox(
            height: 40.0,
          ),
          SizedBox(
            width: 226.0,
            child: Text(
              '(Соответствует 1.34 мг/л в выдыхаемом воздухе)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: gMainColor.withOpacity(0.5),
                fontFamily: gFontRobReg,
                fontSize: 14.0,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const SizedBox(
            width: 266.0,
            child: Text(
              'Указанная концентрация соответствует алкогольному опьянению сильной степени',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: gFontRobReg,
                fontSize: 20.0,
                color: gMainColor,
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Text(
            'Время вывеления из организма',
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: gFontRobReg,
              color: gMainColor.withOpacity(0.5),
            ),
          ),
          Text(
            '${(double.parse(summary) * 1.2).toStringAsFixed(0)} час ${(double.parse(summary) * 1.2 / 60).toStringAsFixed(0)} мин',
            style: TextStyle(
              color: gMainColor,
              fontFamily: gFontNunBold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
