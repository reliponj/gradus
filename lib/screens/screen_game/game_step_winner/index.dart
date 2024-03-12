import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gradus/components/button_green.dart';
import 'package:gradus/components/wrapper_screens.dart';
import 'package:gradus/constants.dart';
import 'package:gradus/helpers/navigator.dart';
import 'package:gradus/screens/screen_game/components/player_item.dart';
import 'package:gradus/states.dart';
import 'package:hive/hive.dart';
import '../../../service/ad_mob.dart';
import 'components/screen_top.dart';

class GameStepWinner extends StatefulWidget {
  const GameStepWinner({Key? key}) : super(key: key);

  @override
  State<GameStepWinner> createState() => _GameStepWinnerState();
}

class _GameStepWinnerState extends State<GameStepWinner> {
  // late BannerAd bannerAd;
  // bool isAdLoaded = false;
  // late InterstitialAd interstitialAd;
  // var interstitialAdUnit =
  //     "ca-app-pub-3940256099942544/1033173712"; // testing ad id
  // var bannerAdUnit = "ca-app-pub-3940256099942544/6300978111"; // testing ad id
  //
  // initInterstitialAd() {
  //   InterstitialAd.load(
  //     adUnitId: interstitialAdUnit,
  //     request: AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (ad) {
  //         interstitialAd = ad;
  //         setState(() {
  //           isAdLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: ((error) {
  //         interstitialAd.dispose();
  //       }),
  //     ),
  //   );
  // }
  //
  // initBannerAd() {
  //   bannerAd = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: bannerAdUnit,
  //     listener: BannerAdListener(onAdLoaded: (ad) {
  //       setState(() {
  //         isAdLoaded = true;
  //       });
  //     }, onAdFailedToLoad: (ad, error) {
  //       ad.dispose();
  //       print(error);
  //     }),
  //     request: const AdRequest(),
  //   );
  //
  //   bannerAd.load();
  // }

  @override
  Widget build(BuildContext context) {
    // if (!isAdLoaded) {
    //   initInterstitialAd();
    //   initBannerAd();
    // }

    int position = 0;
    for (var i = 0; i < playersByScore.length; i++) {
      if (playersToGame[gameLoop[0]] == playersByScore[i]) {
        position = i + 1;
        break;
      }
    }

    final _phrases = Hive.box('phrases');
    int count = _phrases.get('textsWinner').length;
    int random = Random().nextInt(count);

    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreens(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 60.0, bottom: 40.0),
          child: Column(
            children: [
              const ScreenTop(),
              // Container(
              //   height: 20.0,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       if (isAdLoaded) {
              //         interstitialAd.show();
              //       }
              //     },
              //     child: const Text('Interstitial Ad'),
              //   ),
              // ),
              // Container(
              //   child: isAdLoaded
              //       ? SizedBox(
              //     height: bannerAd.size.height.toDouble(),
              //     width: bannerAd.size.width.toDouble(),
              //     child: AdWidget(ad: bannerAd),
              //   )
              //       : const SizedBox(),
              // ),
              const SizedBox(
                height: 5.0,
              ),
              PlayerItem(
                player: playersToGame[gameLoop[0]],
              ),
              const SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0, bottom: 17.0),
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  color: gWhiteColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/image-winner.png',
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      _phrases.get('textsWinner')[random],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: gMainColor,
                        fontSize: 32.0,
                        fontFamily: gFontNunBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                          color: gMainColor,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "+ ${cardsToGame[gameLoop[1]].cardScore}",
                            style: TextStyle(
                              fontFamily: gFontNunBlack,
                              fontSize: 20.0,
                            ),
                          ),
                          TextSpan(
                            text: " баллов",
                            style: TextStyle(
                              fontFamily: gFontNunReg,
                              fontSize: 20.0,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Ты на',
                      style: TextStyle(
                          color: gMainColor.withOpacity(0.5),
                          fontFamily: gFontRobReg,
                          fontSize: 14.0),
                    ),
                    Text(
                      '${position} месте',
                      style: TextStyle(
                          color: gMainColor,
                          fontFamily: gFontNunBold,
                          fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 240.0,
                      child: const Text(
                        'Можешь пропить баллы и поиздеваться над игроками',
                        style: TextStyle(
                            color: gMainColor,
                            fontFamily: gFontRobReg,
                            fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonGreen(
                text: 'завершить ход'.toUpperCase(),
                onPressed: () {
                  // if (gameLoop[1] == 2 ||
                  //     gameLoop[1] == 4 ||
                  //     gameLoop[1] == 6 ||
                  //     gameLoop[1] == 8 ||
                  //     gameLoop[1] == 10) {
                  //   if (isAdLoaded) {
                  //     interstitialAd.show();
                  //   } else {
                  //     if (gameLoop[1] < cardsToGame.length - 1) {
                  //       gameLoop[1]++;
                  //
                  //       if (gameLoop[0] < playersToGame.length - 1) {
                  //         gameLoop[0]++;
                  //       } else {
                  //         gameLoop[0] = 0;
                  //         gameLoop[2]++;
                  //       }
                  //       navigator(context, '/game-step-1');
                  //     } else {
                  //       navigator(context, '/game-step-end');
                  //     }
                  //   }
                  // }

                  if (gameLoop[1] < cardsToGame.length - 1) {
                    gameLoop[1]++;

                    if (gameLoop[0] < playersToGame.length - 1) {
                      gameLoop[0]++;
                    } else {
                      gameLoop[0] = 0;
                      gameLoop[2]++;
                    }
                    gradusNavigator(context, '/game-step-1');
                  } else {
                    gradusNavigator(context, '/game-step-end');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
