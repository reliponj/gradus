import 'dart:io';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseApi {
  static const googleApiKey = 'goog_unHoUEKGIowHaZcUZtBhxvrmnlk';
  static const appleApiKey = '';

  static List<String> googleProductsIds = ['deck_dvigay_puzom'];

  static init() async {
    await Purchases.configure(PurchasesConfiguration(
      Platform.isAndroid
          ? googleApiKey
          : Platform.isIOS
              ? appleApiKey
              : '',
    ));
  }

  static fetchProducts() async {
    List<StoreProduct> products =
        await Purchases.getProducts(googleProductsIds);
    return products;
  }
}
