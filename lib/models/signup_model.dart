// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  String? adi;
  String? soyadi;
  String? telefon;
  String? email;
  String? sifre;

  SignupModel({
    this.adi,
    this.soyadi,
    this.telefon,
    this.email,
    this.sifre,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        adi: json["Adi"],
        soyadi: json["Soyadi"],
        telefon: json["Telefon"],
        email: json["Email"],
        sifre: json["Sifre"],
      );

  Map<String, dynamic> toJson() => {
        "Adi": adi,
        "Soyadi": soyadi,
        "Telefon": telefon,
        "Email": email,
        "Sifre": sifre,
      };
}
