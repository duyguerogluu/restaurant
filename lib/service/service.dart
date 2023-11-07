import 'dart:convert';
import 'dart:math';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:restaurant/models/annoucement_model.dart';
import 'package:restaurant/models/category_item_mmodel.dart';
import 'package:restaurant/models/login_model.dart';
import 'package:restaurant/models/signup_model.dart';
import 'package:restaurant/models/user_model.dart';
import 'package:restaurant/url/url.dart';

class Service {
  //Login
  Future<LoginModel?> loginCall(
      {required String telNo, required String password}) async {
    Map<String, String> jsonData = {
      "Telefon": telNo,
      "Sifre": password,
    };

    final response = await http.post(
      Uri.parse("$baseUrl/KullaniciGiris"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(jsonData),
    );
    print(response.toString());

    if (response.statusCode == 200) {
      debugPrint("Response Body: ${response.body}");
      var result = LoginModel.fromJson(jsonDecode(response.body));

      return result;
    }

    return LoginModel(
        isError: true, errorMsg: "Giriş yapılamadı! Error: ${response.body}");
  }

  // Usercall
  Future<UserModel?> userCall() async {
    String token = await GetStorage().read("token");

    Map<String, dynamic> jsonData = {
      "success": "true",
      "message": "Başarıyla @acarfx kullanıcısının bilgileri okundu.",
      "data": {
        "_id": "64da9708de6cc47d8e70b770",
        "email": "acar.se0666@gmail.com",
        "phone": "5013530006",
        "username": "acarfx",
        "__v": 0,
        "active": true,
        "birthday": 1001970000,
        "createdAt": 1692047112700,
        "password": "123456",
        "token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFjYXJmeCIsInBhc3N3b3JkIjoiMTIzNDU2IiwiaWF0IjoxNjkyMDQ3MTM0fQ.ppuUU8eTHyszendqtE_nGdtfojPXV0fdg_TIAbrV_7g",
        "last_login": 1692614755837,
        "photo": "94e13eef-0507-44a4-ab3a-6db3a3bfa0da.gif"
      },
      "posts": [
        {
          "username": "acarfx",
          "content": "only modern java",
          "date": 1692614743646
        },
        {
          "username": "acarfx",
          "content": "#ictimSarabiDiririirin Veriyom Yaraği @acarfx",
          "images": ["b264773d-e4ac-4a09-b17d-0b88f9c5a0e8.jpg"],
          "tags": ["#ictimSarabiDiririirin"],
          "mentions": ["acarfx"],
          "date": 1692361489728
        }
      ]
    };

    var response = await http.post(Uri.parse(baseUrl + "/user"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
        body: jsonEncode(jsonData));

    debugPrint("Response Status Code userCall: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      final userModel = userModelFromJson(response.body);
      return userModel;
    } else {
      throw ('Failed to login ${response.statusCode}');
    }
  }

  //Singup
  Future<SignupModel?> signupCall({
    required String adi,
    required String soyadi,
    required String email,
    required String telefon,
    required String sifre,
  }) async {
    var user = 'your_proxy_username';
    var pass = 'your_proxy_password';
    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$pass'));

    Map<String, dynamic> jsonData = {
      "adi": adi,
      "soyadi": soyadi,
      "telefon": telefon,
      "email": email,
      "sifre": sifre,
    };

    debugPrint("AUTH: $basicAuth");

    var response = await http.post(
      Uri.parse(baseUrl + "/KullaniciKaydetGuncelle"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
      body: jsonEncode(jsonData),
    );
    if (response.statusCode == 200) {
      debugPrint("Response Body: ${response.body}");
      debugPrint("Response Status Code signupCall: ${response.statusCode}");
      debugPrint("Kayıt okey");
      final signupModel = signupModelFromJson(response.body);
      return signupModel; //jsonDecode(response.body);
    } else {
      debugPrint("Response Status Code signupCall: ${response.statusCode}");
      return null;
    }
  }

  //Duyurular
  Future<List<AnnouncementModel>?> announcementCall() async {
    var response = await http.get(Uri.parse(baseUrl + "/GenelDuyuruListesi"));

    debugPrint("Response Status Code userCall: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      List announcements = jsonDecode(response.body);
      return announcements
          .map<AnnouncementModel>(
            (element) => AnnouncementModel.fromJson(element),
          )
          .toList();
    } else {
      throw ('Failed to get data with status code: ${response.statusCode}');
    }
  }

  Future<List<CategoryItemModel>?> categoryCall() async {
    var response = await http.get(Uri.parse('$baseUrl/Kategoriler'));

    debugPrint("Response Status Code categoryCall: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode != 200 || response.body == 'null') {
      return null;
    }

    var json = jsonDecode(response.body) as List;

    return json
        .map<CategoryItemModel>(
          (e) => CategoryItemModel.fromJson(e),
        )
        .toList();
  }
}
