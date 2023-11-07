// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant/components/loading_popup.dart';
import 'package:restaurant/models/login_model.dart';
import 'package:restaurant/screens/base_scafold.dart';
import 'package:restaurant/screens/main_menu_screen.dart';
import 'package:restaurant/screens/users_profile_page_screen.dart';
import 'package:restaurant/service/service.dart';

class LoginRiverpod extends ChangeNotifier {
  BuildContext? context;
  final service = Service();
  TextEditingController telNo = TextEditingController();
  TextEditingController passwprd = TextEditingController();
  final box = GetStorage();
  final token = GetStorage().read("token");

  Future<bool?> fetchLogin() async {
    log("fetchLogin  çalıştı. Tel: ${telNo.text} Pass: ${passwprd.text}");
    loadingPopup();
    return await service
        .loginCall(telNo: telNo.text, password: passwprd.text)
        .then((LoginModel? loginModel) {
      if (loginModel?.isError != false && loginModel?.adi != "") {
        return true;
      } else {
        return false;
      }
    });
  }

  /*Future<void> fetchLogin(BuildContext context) async {
    debugPrint("fetchLogin çalıştı");
    loadingPopup();

    try {
      var value =
          await service.loginCall(telNo: telNo.text, password: passwprd.text);
      if (value != null) {
        debugPrint(token);
        debugPrint("neden geri gidiyo");
        // Grock.toRemove(const BaseScaffold());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BaseScaffold()),
        );
      } else {
        debugPrint("else e geldi base yönlendirilecek");
        // Grock.back();
        // Grock.snackBar(title: "Hata", description: "Tekrar deneyiniz");
        //Grock.toRemove(const BaseScaffold());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BaseScaffold()),
        );
      }
    } catch (error, stackTrace) {
      debugPrint("Hata oluştu: $error");
      debugPrint(stackTrace.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bir hata oluştu. Lütfen tekrar deneyin.'),
        ),
      );
    }


    service.loginCall(telNo: telNo.text, password: passwprd.text).then((value) {
      if (value != null && value.success == true) {
        box.write("token", value.token);
        debugPrint(token);
        debugPrint("neden geri gidiyo");
        // Grock.toRemove(const BaseScaffold());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BaseScaffold()),
        );
      } else {
        debugPrint("else e geldi base yönlendirilecek");
        // Grock.back();
        // Grock.snackBar(title: "Hata", description: "Tekrar deneyiniz");
        //Grock.toRemove(const BaseScaffold());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BaseScaffold()),
        );
      }
    }).catchError((error) {
      debugPrint("Hata oluştu: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bir hata oluştu. Lütfen tekrar deneyin.'),
        ),
      );
    });
    */
}
