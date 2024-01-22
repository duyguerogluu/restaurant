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
