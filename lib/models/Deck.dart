import 'dart:ffi';

class Deck {
  Deck({
    required this.deckPaymentCode,
    this.deckPromoCode = "",
    required this.deckName,
    required this.deckPrice,
    this.deckCardsCount = 0,
    this.deckCardsCountTrial = 0,
    required this.deckImage,
    required this.deckCards,
  });

  final String deckName;
  final String deckPrice;
  final int deckCardsCount;
  final int deckCardsCountTrial;
  final String deckImage;
  final List deckCards;
  final String deckPaymentCode;
  final String deckPromoCode;
}
