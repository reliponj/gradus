import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradus/components/button_green.dart';
import 'package:gradus/components/wrapper_screens.dart';
import 'package:gradus/constants.dart';
import 'package:gradus/helpers/navigator.dart';
import 'package:gradus/states.dart';
import '../components/player_item.dart';
import 'components/screen_top.dart';

class GameStepLooser extends StatelessWidget {
  const GameStepLooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int position = 0;
    for (var i = 0; i < playersByScore.length; i++) {
      if (playersToGame[gameLoop[0]] == playersByScore[i]) {
        position = i + 1;
        break;
      }
    }

    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreens(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 60.0, bottom: 40.0),
          child: Column(
            children: [
              const ScreenTop(),
              const SizedBox(height: 18.0),
              PlayerItem(
                player: playersToGame[gameLoop[0]],
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0, bottom: 17.0),
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  color: gWhiteColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/image-looser.png',
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'ну не повезло',
                      style: TextStyle(
                          color: gMainColor,
                          fontFamily: gFontRobReg,
                          fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Хлопни штрафную!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: gMainColor,
                        fontSize: 36.0,
                        fontFamily: gFontNunBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Ты на',
                      style: TextStyle(
                          color: gMainColor.withOpacity(0.5),
                          fontFamily: gFontRobReg,
                          fontSize: 14.0),
                    ),
                    Text(
                      '$position месте',
                      style: TextStyle(
                          color: gMainColor,
                          fontFamily: gFontNunBold,
                          fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              // Spacer(),
              const SizedBox(
                height: 30.0,
              ),
              ButtonGreen(
                text: 'завершить ход'.toUpperCase(),
                onPressed: () {
                  if (gameLoop[1] < cardsToGame.length - 1) {
                    gameLoop[1]++;

                    if (gameLoop[0] < playersToGame.length - 1) {
                      gameLoop[0]++;
                    } else {
                      gameLoop[0] = 0;
                      gameLoop[2]++;
                    }

                    gradusNavigator(context, '/game-step-1');
                  } else {
                    print('CARDS END');
                    gradusNavigator(context, '/game-step-end');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
