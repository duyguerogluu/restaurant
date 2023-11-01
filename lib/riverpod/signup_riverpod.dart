import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:restaurant/components/loading_popup.dart';
import 'package:restaurant/loginPage/login_page.dart';
import 'package:restaurant/service/service.dart';

class SignupRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController gender = TextEditingController();
  int? sex;
  late DateTime birthday;

  Future<void> fetchSignup(BuildContext context) async {
    debugPrint("fetchSignup çalıştı");
    loadingPopup();

    birthday = DateTime.now();
    int unixTimestamp = birthday.millisecondsSinceEpoch ~/ 1000;
    debugPrint("unixTimestamp:  $unixTimestamp");

    var result = await service.signupCall(
      username: username.text,
      email: email.text,
      phone: phone.text,
      password: password.text,
      sex: int.tryParse(gender.text) ?? 0,
    );

    if (result?.success == true) {
      debugPrint("result ${result}");
      Grock.back();
      Grock.toRemove(const LoginPage());
    } else {
      Grock.back();
      Grock.snackBar(title: "Hata", description: "Tekrar deneyiniz");
    }
  }
}
