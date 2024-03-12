import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradus/components/button_green.dart';
import 'package:gradus/components/button_outline.dart';
import 'package:gradus/components/wrapper_screens.dart';
import 'package:gradus/constants.dart';
import 'package:gradus/helpers/navigator.dart';
import 'package:gradus/screens/screen_game/components/player_item.dart';

// import 'package:gradus/screens/screen_game/components/player_item.dart';
import '../../../states.dart';
import '../../screen_start/index.dart';
import '../game_step_results/components/player_item.dart';
import 'components/screen_top.dart';

class GameStepEnd extends StatelessWidget {
  const GameStepEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreens(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 60.0, bottom: 40.0),
          child: Column(
            children: [
              const ScreenTop(),
              const SizedBox(
                height: 36.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                decoration: BoxDecoration(
                    color: gWhiteColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Container(
                      child: PlayerItem(
                        player: playersByScore[0],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ButtonGreen(
                      text: 'Все результаты',
                      onPressed: () {
                        gradusNavigator(context, '/game-step-result');
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 350.0,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text:
                          'При опьянении запрещено садиться за руль. \nВоспользуйся ',
                      style: TextStyle(fontFamily: gFontNunReg, fontSize: 16.0),
                      children: [
                        TextSpan(
                            text: 'Алкокалькулятором, ',
                            style: TextStyle(color: gGreenColor)),
                        TextSpan(text: '\nчтобы узнать время отрезвления.')
                      ]),
                ),
              ),
              const SizedBox(
                height: 92.0,
              ),
              ButtonOutline(
                onPressed: () {
                  gradusNavigator(context, '/start');
                },
                child: Text(
                  'выйти в главное меню'.toUpperCase(),
                  style: const TextStyle(
                      color: gWhiteColor,
                      fontFamily: gFontNunBold,
                      fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
