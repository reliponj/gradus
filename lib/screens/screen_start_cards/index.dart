import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradus/helpers/navigator.dart';
import 'package:gradus/models/Deck.dart';
import 'package:gradus/models/DeckCard.dart';
import 'package:gradus/states.dart';
import 'package:hive/hive.dart';

import '../../components/button_green.dart';
import '../../components/wrapper_screens.dart';
import '../../constants.dart';
import 'components/deck_item.dart';
import 'components/screen_top.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'components/switcher_custom.dart';

class DeckInfo {
  DeckInfo({
    required this.deckData,
    required this.deckIsActive,
  });

  final dynamic deckData;
  bool deckIsActive;
}

class ScreenStartCards extends StatelessWidget {
  const ScreenStartCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DeckItem> cards = [];

    var _myBox = Hive.box('myBox');
    var decks = _myBox.get("decks");

    for (var i = 0; i < decks.length; i++) {
      cards.add(DeckItem(deckData: decks[i], deckIsActive: true));
    }

    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreens(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 60.0, bottom: 40.0),
          child: Column(
            children: [
              const ScreenTop(),
              const SizedBox(
                height: 6.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Выбери колоды:',
                style: TextStyle(fontFamily: gFontNunBlack, fontSize: 20.0),
              ),
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 300),
                child: SingleChildScrollView(
                  child: Column(
                    children: cards,
                  ),
                ),
              ),
              const Spacer(),
              ButtonGreen(
                text: "Понеслась",
                onPressed: () {
                  decksToGame = [];
                  cardsToGame = [];

                  cards.forEach(
                    (element) {
                      if (element.deckIsActive) {
                        decksToGame.add(
                          Deck(
                            deckName: element.deckData.deckName,
                            deckPrice: element.deckData.deckPrice,
                            deckCardsCount: element.deckData.deckCardsCount,
                            deckCardsCountTrial: element.deckData.deckCardsCountTrial,
                            deckImage: element.deckData.deckImage,
                            deckCards: element.deckData.deckCards,
                            deckPaymentCode: '',
                          ),
                        );

                        element.deckData.deckCards.forEach(
                          (card) => {
                            if (card.isActive)
                              {
                                cardsToGame.add(
                                  DeckCard(
                                    cardImage: card.cardImage,
                                    cardScore: card.cardScore,
                                  ),
                                ),
                              }
                          },
                        );
                      }
                    },
                  );

                  gradusNavigator(context, '/game-step-1');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
