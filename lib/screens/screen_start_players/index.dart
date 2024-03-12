import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradus/components/button_green.dart';
import 'package:gradus/components/button_orange.dart';
import 'package:gradus/components/button_outline.dart';
import 'package:gradus/components/player_object.dart';
import 'package:gradus/constants.dart';
import 'package:gradus/controllers/game_controller.dart';
import 'package:gradus/helpers/navigator.dart';
import 'package:gradus/helpers/user_shared_storage.dart';
import 'package:gradus/models/Player.dart';
import 'package:gradus/models/game_process.dart';
import 'package:gradus/routes.dart';

import '../../components/wrapper_screens.dart';
import '../../components/player_item.dart';
import 'components/screen_top.dart';

import '../../states.dart';
import 'package:uuid/uuid.dart';

class ScreenStartPlayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = new ScrollController();
    final gameController = Get.find<GameController>();
    gameController.initializePlayers(context);

    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreens(
        child: Obx(() {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 60.0, bottom: 40.0),
            child: Column(
              children: [
                const ScreenTop(),
                const SizedBox(height: 6.0),
                const SizedBox(
                  width: 310.0,
                  child: Text(
                    "Добавь игроков в соответствии с реальным размещением, игра идёт по часовой стрелке",
                    style: TextStyle(
                        fontFamily: gFontRobReg, fontSize: 16.0, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 450,
                  ),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: gameController.getPlayersWidget(),
                    ),
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 20.0),
                const SizedBox(
                  height: 20.0,
                ),
                ButtonOutline(
                  onPressed: () {
                    Future.delayed(Duration(milliseconds: 50))
                        .asStream()
                        .listen((event) {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );
                    });

                    gameController.addPlayer(context);
                  },
                  child: Text(
                    'Добавить игрока'.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: gFontNunBold,
                      color: gWhiteColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                gameController.players.length >= 2
                    ? ButtonGreen(
                        text: language.isEmpty ? '' : language['continue'],
                        onPressed: () async {
                          gameLoop = [0, 0, 0];
                          cardsToGame = [];
                          decksToGame = [];

                          playersByScore = gameController.players;
                          playersToGame = gameController.players;
                          
                          if (!UserSharedStorage.getBool('showStartInfo')) {
                            await UserSharedStorage.setBool('showStartInfo', true);
                            gradusNavigator(context, Routes.startInfo);
                          } else {
                            gradusNavigator(context, Routes.startCards);
                          }
                        },
                      )
                    : const SizedBox(),
                gameController.reload.value ? SizedBox() : SizedBox(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
