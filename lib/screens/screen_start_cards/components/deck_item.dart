import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradus/screens/screen_start_cards/components/switcher_custom.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../constants.dart';

class DeckItem extends StatefulWidget {
  DeckItem({
    super.key,
    required this.deckData,
    required this.deckIsActive,
  });

  final dynamic deckData;
  bool deckIsActive;

  @override
  State<DeckItem> createState() => _DeckItemState();
}

class _DeckItemState extends State<DeckItem> {
  @override
  Widget build(BuildContext context) {
    Future buyDeck() async {
      StoreProduct storeProduct = (await Purchases.getProducts(
        [widget.deckData.deckPaymentCode],
        productCategory: ProductCategory.nonSubscription,
      ))[0];
      await Purchases.purchaseStoreProduct(storeProduct);
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width - 60,
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: gWhiteColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4.0),
                      color: gMainColor.withOpacity(0.15),
                      blurRadius: 4.0,
                    )
                  ],
                ),
                child: widget.deckData.deckImage.contains('http')
                    ? CachedNetworkImage(
                        imageUrl: widget.deckData.deckImage,
                        height: 130,
                      )
                    : Image.asset(widget.deckData.deckImage),
              ),
              const SizedBox(
                width: 30.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.deckData.deckName,
                            style: TextStyle(
                                color: gMainColor,
                                fontFamily: gFontNunBold,
                                fontSize: 16.0),
                          ),
                          SvgPicture.asset('assets/icons/question-blue.svg')
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.deckData.deckPrice} \$',
                          style: TextStyle(
                              color: gGreenColor,
                              fontFamily: gFontNunBlack,
                              fontSize: 24.0),
                        ),
                        SwitchCustom(
                          deckIsActive: widget.deckIsActive,
                          deckIsActiveFunc: (val) {
                            setState(() {
                              widget.deckIsActive = val;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Пробная ",
                        style: TextStyle(color: Color(0xFF808080)),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  '– ${widget.deckData.deckCardsCountTrial} карт',
                              style: TextStyle(
                                  color: gMainColor,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Полная ",
                        style: TextStyle(color: Color(0xFF808080)),
                        children: <TextSpan>[
                          TextSpan(
                            text: "– ${widget.deckData.deckCardsCount} карт ",
                            style: TextStyle(
                                color: gMainColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   "+ отключение рекламы на месяц",
                    //   style:
                    //       TextStyle(color: gMainColor, fontWeight: FontWeight.bold),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              color: gOrangeColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: TextButton(
              onPressed: buyDeck,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor: gOrangeColor,
              ),
              child: Text(
                'купить'.toUpperCase(),
                style: TextStyle(
                  color: gWhiteColor,
                  fontFamily: gFontNunBold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
