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
