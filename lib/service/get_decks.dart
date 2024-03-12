import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

import '../models/Deck.dart';
import '../models/DeckCard.dart';
import '../states.dart';

Future<void> getDecks() async {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('decks');
  DocumentSnapshot docSnapshot =
      await collection.doc('mrAa1NhwGkYerTD1oW9c').get();
  final _myBox = Hive.box('myBox');

  if (docSnapshot.exists) {
    Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

    for (var i = 0; i < data['decks'].length; i++) {
      var deckName = data['decks'][i]['name'];
      var deckImage = data['decks'][i]['image'];
      var deckPrice = data['decks'][i]['price'];
      var deckPaymentCode = data['decks'][i]['paymentCode'];
      var deckCardsCount = data['decks'][i]['cards'].length;
      var deckCardsCountTrial = 0;
      var deckCards = [];

      for (var c = 0; c < data['decks'][i]['cards'].length; c++) {
        if (data['decks'][i]['cards'][c]['isActive']) {
          deckCardsCountTrial++;
        }

        deckCards.add(
          DeckCard(
            cardImage: data['decks'][i]['cards'][c]['image'],
            cardScore: data['decks'][i]['cards'][c]['score'],
            isActive: data['decks'][i]['cards'][c]['isActive'],
          ),
        );
      }

      deckList.add(
        Deck(
          deckName: deckName,
          deckPrice: deckPrice.toString(),
          deckCardsCount: deckCardsCount,
          deckCardsCountTrial: deckCardsCountTrial,
          deckImage: deckImage,
          deckCards: deckCards,
          deckPaymentCode: deckPaymentCode,
        ),
      );
    }

    _myBox.put("decks", deckList);
  } else {
    print('Документ не найден.');
  }
}
