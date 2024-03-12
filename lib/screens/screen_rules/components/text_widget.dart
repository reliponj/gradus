import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          height: 461.0,
          child: SvgPicture.asset('assets/images/mini-corners.svg'),
        ),
        Positioned(
          width: 280.0,
          child: Column(
            children: const [
              Text(
                'Выполняй задания, шути над другими игроками, выпивай и хорошенько закусывай.',
                style: TextStyle(
                    fontSize: 20.0,
                    color: gWhiteColor,
                    fontFamily: gFontRobReg),
                textAlign: TextAlign.center,
              ),
              Text('',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: gWhiteColor,
                      fontFamily: gFontRobReg),
                  textAlign: TextAlign.center),
              Text(
                'В этой игре алкоголь возможен (с ним прикольнее), но не обязателен.',
                style: TextStyle(
                    fontSize: 20.0,
                    color: gWhiteColor,
                    fontFamily: gFontRobReg,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              Text('',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: gWhiteColor,
                      fontFamily: gFontRobReg),
                  textAlign: TextAlign.center),
              Text(
                'Чрезмерное употребление алкоголя вредит вашему здоровью.',
                style: TextStyle(
                  fontSize: 20.0,
                  color: gWhiteColor,
                  fontFamily: gFontRobReg,
                ),
                textAlign: TextAlign.center,
              ),
              Text('',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: gWhiteColor,
                      fontFamily: gFontRobReg),
                  textAlign: TextAlign.center),
              Text(
                'Воспользуйтесь нашим Алкокалькулятором, чтоб узнать приблизительное время отрезвления.',
                style: TextStyle(
                  fontSize: 20.0,
                  color: gWhiteColor,
                  fontFamily: gFontRobReg,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
