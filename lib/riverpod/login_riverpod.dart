// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

/*
 *  This file is part of restaurant.
 *
 *  restaurant is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  restaurant is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *   along with restaurant.  If not, see <https://www.gnu.org/licenses/>.
 */

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
  TextEditingController telNo = TextEditingController();
  TextEditingController passwprd = TextEditingController();
  final box = GetStorage();
  final token = GetStorage().read("token");

  Future<bool?> fetchLogin() async {
    log("fetchLogin  çalıştı. Tel: ${telNo.text} Pass: ${passwprd.text}");
    loadingPopup();
    return await Service.loginCall(telNo: telNo.text, password: passwprd.text)
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
