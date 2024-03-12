import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gradus/api/purchase_api.dart';
import 'package:gradus/controllers/game_controller.dart';
import 'package:gradus/helpers/user_shared_storage.dart';
import 'package:gradus/routes.dart';
import 'package:gradus/screens/screen_alcocalculate/index.dart';
import 'package:gradus/screens/screen_alcocalculate_done/index.dart';
import 'package:gradus/screens/screen_decks/index.dart';
import 'package:gradus/screens/screen_game/game_step_1/index.dart';
import 'package:gradus/screens/screen_game/game_step_2/index.dart';
import 'package:gradus/screens/screen_game/game_step_end/index.dart';
import 'package:gradus/screens/screen_game/game_step_looser/index.dart';
import 'package:gradus/screens/screen_game/game_step_menu/index.dart';
import 'package:gradus/screens/screen_game/game_step_results/index.dart';
import 'package:gradus/screens/screen_game/game_step_winner/index.dart';
import 'package:gradus/screens/screen_rules/index.dart';
import 'package:gradus/screens/screen_start/index.dart';
import 'package:gradus/screens/screen_start_cards/index.dart';
import 'package:gradus/screens/screen_start_info/index.dart';
import 'package:gradus/screens/screen_start_players/index.dart';
import 'package:gradus/service/fcm_helper.dart';
import 'package:gradus/service/get_decks.dart';
import 'package:gradus/service/get_texts.dart';
import 'package:gradus/states.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'helpers/languages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



final _configure = PurchasesConfiguration('goog_unHoUEKGIowHaZcUZtBhxvrmnlk');
// final _configure = PurchasesConfiguration('goog_TzjxWvqgWPCAuChOdJehNzGFJKP');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  await Hive.openBox('phrases');

  getTexts();
  getDecks();

  await PurchaseApi.init();

  // MobileAds.instance.initialize();

  final _myBox = Hive.box('myBox');
  final _phrases = Hive.box('phrases');

  _myBox.put("decks", deckList);
  _phrases.put("textsPhrase", listPhrases);
  _phrases.put("textsCancel", titleCancelButton);
  _phrases.put("textsWinner", titleWinner);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await UserSharedStorage.getPrefs();

  runApp(MyApp());
  lang();
}

class GameBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(GameController());
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: InAppNotification(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            // useMaterial3: true,
            // colorSchemeSeed: const Color(0xff00A878),
          ),
          initialBinding: GameBinding(),
          initialRoute: Routes.start,
          getPages: getPages,
        ),
      ),
    );
  }
}
