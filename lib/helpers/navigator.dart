import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradus/screens/screen_alcocalculate/index.dart';
import 'package:gradus/screens/screen_alcocalculate_done/index.dart';
import 'package:gradus/screens/screen_decks/index.dart';
import 'package:gradus/screens/screen_game/game_step_1/index.dart';
import 'package:gradus/screens/screen_game/game_step_2/index.dart';
import 'package:gradus/screens/screen_game/game_step_end/index.dart';
import 'package:gradus/screens/screen_game/game_step_looser/index.dart';
import 'package:gradus/screens/screen_game/game_step_menu/index.dart';
import 'package:gradus/screens/screen_game/game_step_results/index.dart';
import 'package:gradus/screens/screen_game/game_step_winner/index.dart';
import 'package:gradus/screens/screen_rules/index.dart';
import 'package:gradus/screens/screen_start/index.dart';
import 'package:gradus/screens/screen_start_cards/index.dart';
import 'package:gradus/screens/screen_start_info/index.dart';
import 'package:gradus/screens/screen_start_players/index.dart';

gradusNavigator(context, place) {
  Map routes = {
    '/rules': ScreenRules(),
    '/decks': ScreenDecks(),
    '/alco-calculate': ScreenAlcoCalculate(),
    '/alco-calculate-done': ScreenAlcoCalculateDone(),
    '/start': ScreenMain(),
    '/start-players': ScreenStartPlayers(),
    '/start-info': ScreenStartInfo(),
    '/start-cards': ScreenStartCards(),
    '/game-step-1': GameStep1(),
    '/game-step-2': GameStep2(),
    '/game-step-menu': GameStepMenu(),
    '/game-step-winner': GameStepWinner(),
    '/game-step-looser': GameStepLooser(),
    '/game-step-result': GameStepResult(),
    '/game-step-end': GameStepEnd(),
  };

  Get.toNamed(place);
}
