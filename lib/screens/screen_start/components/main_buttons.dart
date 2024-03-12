import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradus/helpers/languages.dart';
import 'package:gradus/helpers/navigator.dart';
import 'package:gradus/screens/screen_alcocalculate/index.dart';
import 'package:gradus/screens/screen_start_players/index.dart';
import 'package:gradus/states.dart';

import '../../../components/button_green.dart';
import '../../../components/button_orange.dart';
import '../../../components/button_outline.dart';
import '../../../constants.dart';
import '../index.dart';

class MainButtons extends StatefulWidget {
  const MainButtons({
    super.key,
  });

  @override
  State<MainButtons> createState() => _MainButtonsState();
}

class _MainButtonsState extends State<MainButtons> {
  @override
  Widget build(BuildContext context) {

    if(language.isEmpty) {
      Future.delayed(Duration(seconds: 5));
      lang();
    }

    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          ButtonGreen(
            text: language.isEmpty ? 'Почати гру' : language['start_game'],
            onPressed: () {
              gradusNavigator(context, '/start-players');
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          ButtonOrange(
            text: language.isEmpty ? 'Додати картки' : language['add_cards'],
            onPressed: () {
              gradusNavigator(context, '/decks');
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          ButtonOutline(
            child: Text(
              language.isEmpty ? 'Правила'.toUpperCase() : language['rules']?.toUpperCase(),
              style: const TextStyle(
                color: gWhiteColor,
                fontFamily: gFontNunBold,
                fontSize: 16.0,
              ),
            ),
            onPressed: () {
              gradusNavigator(context, '/rules');
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          ButtonOutline(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/speed-meter.svg'),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  language.isEmpty ? 'Алкокалькулятор'.toUpperCase() : language['alco_calculate']?.toUpperCase(),
                  style: const TextStyle(
                    color: gWhiteColor,
                    fontFamily: gFontNunBold,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
            onPressed: () {
              calculateWeight = '';
              calculateHeight = '';
              calculateDrinkPercent1 = '';
              calculateDrinkMl1 = '';
              isButtonClickCalculate = false;
              gradusNavigator(context, '/alco-calculate');
            },
          ),
        ],
      ),
    );
  }
}
