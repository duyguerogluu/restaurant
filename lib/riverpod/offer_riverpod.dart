import 'package:flutter/material.dart';
import 'package:restaurant/models/offer_model.dart';
import 'package:restaurant/service/service.dart';

class OfferRiverpod extends ChangeNotifier {
 

  Future<List<OfferModel>?> getOffer() async {
    debugPrint("getOffer çalıştııı !!!!!!!!!!!!!!!!!");

    try {
      var value = await Service.offerCall();

      if (value != null) {
        return value;
      } else {
        debugPrint("Değerler null dönüyo napalımmm!!!!!!!!");
      }
    } catch (error, stackTrace) {
      debugPrint("Hata oluştu: $error");
      debugPrint(stackTrace.toString());
    }

    return null;
  }
}
