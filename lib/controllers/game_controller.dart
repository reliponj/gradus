import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradus/components/player_item.dart';
import 'package:gradus/constants.dart';
import 'package:gradus/models/Player.dart';
import 'package:gradus/service/service.dart';
import 'package:uuid/uuid.dart';

class GameController extends GetxController {
  List<Player> players = [];
  final reload = false.obs;

  reloadState() {
    reload(!reload.value);
  }

  addPlayer(context) {
    if (players.length >= 20) {
      showAlert(
          text: 'Нельзя добавлять больше 20 игроков.',
          context: context,
          error: true);
      return;
    }

    var uuid = const Uuid();
    var randomId = uuid.v4();
    var randomMax = 7;

    var randomName = Random().nextInt(randomMax);
    var randomAvatar = Random().nextInt(randomMax);
    var randomBodyColor = Random().nextInt(randomMax);
    var randomHeadColor = Random().nextInt(randomMax);

    Player player = Player(
      id: randomId,
      title: playersName[randomName],
      icon: SvgPicture.asset(playersAvatar[randomAvatar]),
      colorIcon: playersColor[randomHeadColor],
      colorBody: playersColor[randomBodyColor],
      score: 0,
    );
    players.add(player);
    reloadState();
  }

  initializePlayers(context) {
    if (players.length == 0) {
      for (int i = 0; i < 3; i++) {
        addPlayer(context);
      }
    }
  }

  removePlayer(i) {
    players.removeAt(i);
    reloadState();
  }

  getPlayersWidget() {
    List<Widget> playersList = [];

    for (var i = 0; i < players.length; i++) {
      playersList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: gWhiteColor,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Center(
              child: Text(
                '${i + 1}',
                style: TextStyle(
                  fontFamily: gFontRobReg,
                  color: gMainColor,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          players.isNotEmpty
              ? PlayerItem(
                  player: players[i],
                  onChanged: (value) {
                    players[i].title = value;
                  },
                )
              : SizedBox(
                  width: 0.0,
                ),
          Container(
            width: 20.0,
            height: 20.0,
            child: ElevatedButton(
              onPressed: () {
                removePlayer(i);
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  foregroundColor: gMainColor),
              child: SvgPicture.asset('assets/icons/delete-player.svg'),
            ),
          ),
        ],
      ));
    }
    return playersList;
  }
}
