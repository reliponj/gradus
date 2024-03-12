import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradus/models/Player.dart';

import 'models/Deck.dart';
import 'models/DeckCard.dart';

class ModelPlayers {
  final String title;
  final Color colorIcon;
  final Color colorBody;
  final SvgPicture icon;
  final String litres;
  final bool isWinner;

  ModelPlayers(this.title,
      this.colorIcon,
      this.colorBody,
      this.icon,
      this.litres,
      this.isWinner,);
}

class ModelDrink {
  ModelDrink();
}

Map language = {};
String languageCode = 'ua';

bool isButtonClickCalculate = false;
bool calculateSex = false;
bool calculateStomach = false;
double calculateSum = 0.0;
String calculateWeight = '';
String calculateHeight = '';
String calculateDrinkPercent1 = '';
String calculateDrinkMl1 = '';
String calculateDrinkPercent2 = '0';
String calculateDrinkMl2 = '0';
String calculateDrinkPercent3 = '0';
String calculateDrinkMl3 = '0';

bool isOpenQuestion = false;

bool isOpenSettings = false;
bool isTurnVolume = true;
bool isTurnAutoShuffling = true;

List<int> gameLoop = [0, 0, 0];

List<Player> playersToGame = [];
List<Player> playersByScore = [];
List<Deck> decksToGame = [];
List<DeckCard> cardsToGame = [];

List<Deck> deckList = [];

List<dynamic> listPhrases = [];
List<dynamic> titleCancelButton = [];
List<dynamic> titleWinner = [];

