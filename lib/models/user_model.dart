// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? adi;
  String? soyadi;
  String? telefon;
  String? email;
  String? sifre;
  bool? yetkili;
  String? yetkiDurum;

  UserModel({
    this.id,
    this.adi,
    this.soyadi,
    this.telefon,
    this.email,
    this.sifre,
    this.yetkili,
    this.yetkiDurum,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["ID"],
        adi: json["Adi"],
        soyadi: json["Soyadi"],
        telefon: json["Telefon"],
        email: json["Email"],
        sifre: json["Sifre"],
        yetkili: json["Yetkili"],
        yetkiDurum: json["YetkiDurum"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Adi": adi,
        "Soyadi": soyadi,
        "Telefon": telefon,
        "Email": email,
        "Sifre": sifre,
        "Yetkili": yetkili,
        "YetkiDurum": yetkiDurum,
      };
}
