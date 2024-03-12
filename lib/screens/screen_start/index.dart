import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gradus/api/purchase_api.dart';
import 'package:gradus/constants.dart';
import 'package:gradus/service/firebase_cloud.dart';
import 'package:gradus/states.dart';
import 'package:hive/hive.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../../components/button_outline.dart';
import '../../components/wrapper_screens.dart';
import 'components/main_buttons.dart';
import 'components/settings/index.dart';
import 'components/top_buttons.dart';
import 'package:in_app_review/in_app_review.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({Key? key}) : super(key: key);

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {

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


    return Scaffold(
      backgroundColor: gMainColor,
      body: WrapperScreens(
        child: Stack(
          children: [
            FirebaseCloud(documentId: 'mrAa1NhwGkYerTD1oW9c', collectionId: 'decks',),

            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 40.0, bottom: 40.0),
              child: Column(
                children: [
                  TopButtons(
                    isSettingsOpen: () {
                      setState(() {
                        isOpenSettings = true;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Image.asset('assets/images/logo.png'),
                  const Spacer(),
                  const MainButtons(),
                  const Spacer(),
                  SizedBox(
                    height: 10.0,
                  ),
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
                  //           height: bannerAd.size.height.toDouble(),
                  //           width: bannerAd.size.width.toDouble(),
                  //           child: AdWidget(ad: bannerAd),
                  //         )
                  //       : const SizedBox(),
                  // ),
                  ButtonOutline(
                    child: Text(
                      "Залишити відгук".toUpperCase(),
                      style: const TextStyle(
                        color: gWhiteColor,
                        fontFamily: gFontNunBold,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () async {
                      final InAppReview inAppReview = InAppReview.instance;

                      if (await inAppReview.isAvailable()) {
                        inAppReview.requestReview();
                      }
                    },
                  ),
                ],
              ),
            ),
            isOpenSettings
                ? Positioned(
                    child: SettingsWindow(onPressed: () {
                      setState(() {
                        isOpenSettings = false;
                      });
                    }),
                  )
                : const SizedBox(),
          ],
        ),
      ),
      // bottomNavigationBar: isAdLoaded
      //     ? SizedBox(
      //         height: bannerAd.size.height.toDouble(),
      //         width: bannerAd.size.width.toDouble(),
      //         child: AdWidget(ad: bannerAd),
      //       )
      //     : const SizedBox(),
    );
  }
}
