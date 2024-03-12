import 'package:flutter/material.dart';
import 'package:gradus/components/modal_wrapper.dart';
import 'package:gradus/states.dart';
import 'package:hive/hive.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';

import '../../components/wrapper_screens.dart';
import '../../constants.dart';
import '../screen_start_cards/components/deck_item.dart';
import 'components/custom_input.dart';
import 'components/modal_promo.dart';
import 'components/modal_question.dart';
import 'components/screen_top.dart';

class ScreenDecks extends StatefulWidget {
  const ScreenDecks({Key? key}) : super(key: key);

  @override
  State<ScreenDecks> createState() => _ScreenDecksState();
}

class _ScreenDecksState extends State<ScreenDecks> {
  bool _isPromoModalOpen = false;

  @override
  Widget build(BuildContext context) {
    List<DeckItem> cards = [];
    int allCards = 0;

    var _myBox = Hive.box('myBox');
    var decks = _myBox.get("decks");

    for (var i = 0; i < decks.length; i++) {
      allCards += int.parse(decks[i].deckCardsCount.toString());
      cards.add(DeckItem(deckData: decks[i], deckIsActive: true));
    }

    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreens(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 60.0, bottom: 40.0),
              child: Column(
                children: [
                  ScreenTop(
                    allCards: allCards,
                    onPressed: () {
                      setState(() {
                        isOpenQuestion = true;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height - 160),
                    child: SingleChildScrollView(
                      child: Column(
                        children: cards,
                        // children: [
                        //   DeckItem(
                        //     promoDeck: () {
                        //       setState(() {
                        //         _isPromoModalOpen = true;
                        //       });
                        //     },
                        //   ),
                        //   DeckItem(
                        //     // buyDeck: () async {
                        //     //   await Purchases.purchaseProduct('deck_id');
                        //     // },
                        //   ),
                        //   DeckItem(
                        //     buyDeck: () => {
                        //       print('buy deck 11'),
                        //     },
                        //   ),
                        //   DeckItem(),
                        //   DeckItem(),
                        //   DeckItem(),
                        // ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _isPromoModalOpen
                ? ModalPromo(
                    onPressed: () {
                      setState(() {
                        _isPromoModalOpen = false;
                      });
                    },
                  )
                : SizedBox(),
            isOpenQuestion
                ? ModalQuestion(
                    onPressed: () {
                      setState(() {
                        isOpenQuestion = false;
                      });
                    },
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
