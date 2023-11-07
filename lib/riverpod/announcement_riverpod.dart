import 'package:flutter/material.dart';
import 'package:restaurant/models/annoucement_model.dart';
import 'package:restaurant/service/service.dart';

class AnnouncementRiverpod extends ChangeNotifier {
  final service = Service();

  Future<List<AnnouncementModel>?> getAnnouncement() async {
    debugPrint("getchannoucement çalıştııı !!!!!!!!!!!!!!!!!");

    try {
      var value = await service.announcementCall();

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
