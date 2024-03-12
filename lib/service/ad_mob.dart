// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class AdMobService {
//   InterstitialAd? _interstitialAd;
//
//   final adUnitId = Platform.isAndroid
//       ? 'ca-app-pub-9452256556343979~6308807494'
//       : 'ca-app-pub-9452256556343979/1641080927';
//
//   void loadAd() {
//     InterstitialAd.load(
//       adUnitId: adUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) {
//           debugPrint('$ad loaded.');
//           _interstitialAd = ad;
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           debugPrint('InterstitialAd failed to load: $error');
//         },
//       ),
//     );
//   }
//
//   static String? get bannerAdUnitId {
//     if(Platform.isAndroid) {
//       return 'ca-app-pub-9452256556343979~6308807494';
//     } else if (Platform.isIOS) {
//       return 'ca-app-pub-9452256556343979/1641080927';
//     }
//     return null;
//   }
//
//   static String? get interstitialAdUnitId {
//     if(Platform.isAndroid) {
//       return 'ca-app-pub-9452256556343979~6308807494';
//     } else if (Platform.isIOS) {
//       return 'ca-app-pub-9452256556343979/1641080927';
//     }
//     return null;
//   }
//
//   static final BannerAdListener bannerListener = BannerAdListener(
//     onAdLoaded: (ad) => {
//       debugPrint('Ad loaded.'),
//       print('asd')
//     },
//     onAdFailedToLoad: (ad, error) {
//       ad.dispose();
//       debugPrint('Ad failed to load: $error');
//     },
//     onAdOpened: (ad) => debugPrint('Ad opened'),
//     onAdClosed: (ad) => debugPrint('Ad closed'),
//   );
// }
