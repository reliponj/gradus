class DeckCard {

  DeckCard({
    required this.cardImage,
    required this.cardScore,
    this.isActive = true,
  });

  String cardImage;
  int cardScore;
  bool isActive;

}