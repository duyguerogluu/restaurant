import 'package:flutter/material.dart';
import 'package:restaurant/components/loading_popup.dart';
import 'package:restaurant/loginPage/login_page.dart';
import 'package:restaurant/service/service.dart';

class SignupRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController adi = TextEditingController();
  TextEditingController soyadi = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();

  Future<void> fetchSignup(BuildContext context) async {
    debugPrint("fetchSignup çalıştı");
    loadingPopup();

    var result = await service.signupCall(
      adi: adi.text,
      soyadi: soyadi.text,
      email: email.text,
      telefon: telefon.text,
      sifre: sifre.text,
    );

    //Grock.toRemove(const LoginPage());
  }
}
