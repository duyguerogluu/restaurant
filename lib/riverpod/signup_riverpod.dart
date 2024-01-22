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
import 'package:restaurant/components/loading_popup.dart';
import 'package:restaurant/loginPage/login_page.dart';
import 'package:restaurant/service/service.dart';

class SignupRiverpod extends ChangeNotifier {
  TextEditingController adi = TextEditingController();
  TextEditingController soyadi = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();

  Future<void> fetchSignup(BuildContext context) async {
    debugPrint("fetchSignup çalıştı");
    loadingPopup();

    var result = await Service.signupCall(
      adi: adi.text,
      soyadi: soyadi.text,
      email: email.text,
      telefon: telefon.text,
      sifre: sifre.text,
    );

    //Grock.toRemo
  }
}
