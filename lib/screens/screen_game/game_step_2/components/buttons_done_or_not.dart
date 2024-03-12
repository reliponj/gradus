import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gradus/helpers/navigator.dart';
import 'package:gradus/states.dart';
import 'package:hive/hive.dart';

import '../../../../constants.dart';

class ButtonsDoneOrNot extends StatefulWidget {
  const ButtonsDoneOrNot({
    super.key,
  });

  @override
  State<ButtonsDoneOrNot> createState() => _ButtonsDoneOrNotState();
}

class _ButtonsDoneOrNotState extends State<ButtonsDoneOrNot> {
  @override
  Widget build(BuildContext context) {

    final _phrases = Hive.box('phrases');
    int count = _phrases.get('textsCancel').length;
    int random = Random().nextInt(count);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            playersByScore.sort((a, b) => b.score.compareTo(a.score));

            gradusNavigator(context, '/game-step-looser');
          },
          style: TextButton.styleFrom(foregroundColor: gMainColor, padding: EdgeInsets.zero),
          child: Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
                color: Color(0xFFFF3C38),
                borderRadius: BorderRadius.circular(50.0)),
            child: Center(
              child: Text(
                _phrases.get('textsCancel')[random].toUpperCase(),
                style: TextStyle(
                  fontFamily: gFontNunBold,
                  color: gWhiteColor,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        TextButton(
          onPressed: () {
            playersToGame[gameLoop[0]].score += cardsToGame[gameLoop[1]].cardScore;
            for(var i = 0; i < playersByScore.length; i++) {
              if(playersToGame[gameLoop[0]] == playersByScore[i]) {
                playersByScore[i].score += cardsToGame[gameLoop[1]].cardScore;
                break;
              }
            }
            playersByScore.sort((a, b) => b.score.compareTo(a.score));

            gradusNavigator(context, '/game-step-winner');
          },
          style: TextButton.styleFrom(foregroundColor: gMainColor, padding: EdgeInsets.zero),
          child: Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
                color: Color(0xFF00A878),
                borderRadius: BorderRadius.circular(50.0)),
            child: Center(
              child: Text(
                'Готово'.toUpperCase(),
                style: TextStyle(
                  fontFamily: gFontNunBlack,
                  color: gWhiteColor,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
