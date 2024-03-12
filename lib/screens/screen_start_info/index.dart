import 'package:flutter/material.dart';
import 'package:gradus/components/wrapper_screens_elems.dart';
import 'package:gradus/helpers/navigator.dart';

import '../../components/button_green.dart';
import '../../constants.dart';
import 'components/screen_top.dart';

class ScreenStartInfo extends StatelessWidget {
  const ScreenStartInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreensElems(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 60.0, bottom: 40.0),
          child: Column(
            children: [
              const ScreenTop(),
              const SizedBox(
                height: 6.0,
              ),
              
              const Spacer(),
              Container(
                width: 310.0,
                height: MediaQuery.of(context).size.height / 1.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Text(
                        'Выбери колоды:',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: gFontNunBlack,
                            color: gWhiteColor),
                      ),
                      SizedBox(
                        height: 21.0,
                      ),
                      Text(
                        "По умолчанию включены все колоды. Если в вашей компании определённая колода не подходит – то её можно отключить.",
                        style: TextStyle(
                            fontFamily: gFontRobReg, fontSize: 16.0, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontFamily: gFontRobReg, fontSize: 16.0, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Полноценно играть можно и в пробную версию, но чтоб больше насладиться игрой, получить больше крутых заданий, открыть всё Бонус-меню и отключить рекламу необходимо купить колоды или комплекты",
                        style: TextStyle(
                            fontFamily: gFontRobReg, fontSize: 16.0, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontFamily: gFontRobReg, fontSize: 16.0, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Отключить рекламу навсегда можно купив одно из спецпредложений или 5 любых колод отдельно.",
                        style: TextStyle(
                            fontFamily: gFontRobReg, fontSize: 16.0, height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ButtonGreen(text: "Продолжить", onPressed: () {
                gradusNavigator(context, '/start-cards');
              })
            ],
          ),
        ),
      ),
    );
  }
}
