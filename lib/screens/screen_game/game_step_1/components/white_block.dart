import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradus/constants.dart';

import '../../../../states.dart';
import '../../components/player_item.dart';

class WhiteBlock extends StatelessWidget {
  const WhiteBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int position = 0;
    for (var i = 0; i < playersByScore.length; i++) {
      if (playersToGame[gameLoop[0]] == playersByScore[i]) {
        position = i + 1;
        break;
      }
    }

    return Container(
      width: MediaQuery.of(context).size.width - 60,
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
          color: gWhiteColor, borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlayerItem(
              player: playersToGame[gameLoop[0]],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Место № ${position} ',
              // '',
              style: TextStyle(
                fontFamily: gFontNunBlack,
                color: gMainColor,
                fontSize: 24.0,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              'Выпито:',
              style: TextStyle(
                fontFamily: gFontRobReg,
                color: gMainColor.withOpacity(0.5),
                fontSize: 16.0,
              ),
            ),
            Text(
              playersToGame[gameLoop[0]].score == 0
                  ? 'Трезвый как стеклышко'
                  : "${playersToGame[gameLoop[0]].score} мл",
              style: TextStyle(
                  fontFamily: gFontRobBold, color: gMainColor, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
