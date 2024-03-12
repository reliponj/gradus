import 'package:get/get_navigation/src/routes/get_route.dart';
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

class Routes {
  static String rules = '/rules';
  static String decks = '/decks';
  static String alcoCalculate = '/alco-calculate';
  static String alcoCalculateDone = '/alco-calculate-done';
  static String start = '/start';
  static String startPlayers = '/start-players';
  static String startInfo = '/start-info';
  static String startCards = '/start-cards';
  static String gameStep1 = '/game-step-1';
  static String gameStep2 = '/game-step-2';
  static String gameStepMenu = '/game-step-menu';
  static String gameStepWinner = '/game-step-winner';
  static String gameStepLooser = '/game-step-looser';
  static String gameStepResult = '/game-step-result';
  static String gameStepEnd = '/game-step-end';
}

final getPages = [
  GetPage(
    name: Routes.rules,
    page: () => const ScreenRules(),
  ),
  GetPage(
    name: Routes.decks,
    page: () => const ScreenDecks(),
  ),
  GetPage(
    name: Routes.alcoCalculate,
    page: () => const ScreenAlcoCalculate(),
  ),
  GetPage(
    name: Routes.alcoCalculateDone,
    page: () => const ScreenAlcoCalculateDone(),
  ),
  GetPage(
    name: Routes.start,
    page: () => const ScreenMain(),
  ),
  GetPage(
    name: Routes.startPlayers,
    page: () => ScreenStartPlayers(),
  ),
  GetPage(
    name: Routes.startInfo,
    page: () => const ScreenStartInfo(),
  ),
  GetPage(
    name: Routes.startCards,
    page: () => const ScreenStartCards(),
  ),
  GetPage(
    name: Routes.gameStep1,
    page: () => const GameStep1(),
  ),
  GetPage(
    name: Routes.gameStep2,
    page: () => const GameStep2(),
  ),
  GetPage(
    name: Routes.gameStepMenu,
    page: () => const GameStepMenu(),
  ),
  GetPage(
    name: Routes.gameStepWinner,
    page: () => const GameStepWinner(),
  ),
  GetPage(
    name: Routes.gameStepLooser,
    page: () => const GameStepLooser(),
  ),
  GetPage(
    name: Routes.gameStepResult,
    page: () => const GameStepResult(),
  ),
  GetPage(
    name: Routes.gameStepEnd,
    page: () => const GameStepEnd(),
  ),
];