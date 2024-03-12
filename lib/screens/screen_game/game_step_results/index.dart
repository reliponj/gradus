import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradus/components/button_outline.dart';
import 'package:gradus/components/wrapper_screens.dart';
import 'package:gradus/constants.dart';
import 'package:gradus/screens/screen_game/components/player_item.dart';
import '../../../states.dart';
import 'components/player_item.dart';
import 'components/screen_top.dart';

class GameStepResult extends StatelessWidget {
  const GameStepResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> players = [];
    for (int i = 0; i <= playersByScore.length - 1; i++) {
      players.add(Row(
        children: [
          SizedBox(
            width: 30.0,
          ),
          PlayerItem(
            player: playersToGame[gameLoop[0]],
          ),
          Text("${playersByScore[i].score}"),
        ],
      ));
    }

    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreens(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 60.0, bottom: 40.0),
          child: Column(
            children: [
              ScreenTop(),
              Spacer(),
              Column(
                // children: players,
                children: players,
              ),
              Spacer(),
              // ButtonOutline(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       SvgPicture.asset('assets/icons/arrow-back-button.svg'),
              //       const SizedBox(
              //         width: 10.0,
              //       ),
              //       Text(
              //         'вернуться'.toUpperCase(),
              //         style: const TextStyle(
              //           fontFamily: gFontNunBold,
              //           fontSize: 16.0,
              //           color: gWhiteColor,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
