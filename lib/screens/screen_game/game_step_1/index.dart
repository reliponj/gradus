import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gradus/components/button_green.dart';
import 'package:gradus/components/button_outline.dart';
import 'package:gradus/components/wrapper_screens.dart';
import 'package:gradus/constants.dart';
import 'package:gradus/helpers/navigator.dart';
import 'package:gradus/states.dart';
import 'package:hive/hive.dart';
import 'components/screen_top.dart';
import 'components/white_block.dart';

class GameStep1 extends StatelessWidget {
  const GameStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _phrases = Hive.box('phrases');
    int count = _phrases.get('textsPhrase').length;
    int random = Random().nextInt(count);

    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreens(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 60.0, bottom: 40.0),
          child: Column(
            children: [
              ScreenTop(),
              SizedBox(
                height: 18.0,
              ),
              Text(
                'Ходит:',
                style: TextStyle(
                  color: gWhiteColor.withOpacity(0.5),
                  fontSize: 20.0,
                  fontFamily: gFontRobReg,
                ),
              ),
              SizedBox(
                height: 17.0,
              ),
              WhiteBlock(),
              SizedBox(height: 30.0,),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  _phrases.get('textsPhrase')[random],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: gFontNunReg,
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
              ButtonGreen(text: 'понеслась!', onPressed: () {
                gradusNavigator(context, '/game-step-2');
              }),
              SizedBox(
                height: 20.0,
              ),
              ButtonOutline(
                onPressed: () {
                  gradusNavigator(context, '/game-step-result');
                },
                child: Text(
                  'Кто самый пьяненький'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: gFontNunBold,
                    fontSize: 16.0,
                    color: gWhiteColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
