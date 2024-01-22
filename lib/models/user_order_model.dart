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
//     final userOrderModel = userOrderModelFromJson(jsonString);

import 'dart:convert';

UserOrderModel userOrderModelFromJson(String str) =>
    UserOrderModel.fromJson(json.decode(str));

String userOrderModelToJson(UserOrderModel data) => json.encode(data.toJson());

class UserOrderModel {
  String? kullaniciId;
  String? menuFiyatId;
  int? fiyat;
  int? indirim;
  String? indirimTipiFiyat;
  DateTime? siparisTarihi;
  String? enlem;
  String? boylam;

  UserOrderModel({
    this.kullaniciId,
    this.menuFiyatId,
    this.fiyat,
    this.indirim,
    this.indirimTipiFiyat,
    this.siparisTarihi,
    this.enlem,
    this.boylam,
  });

  factory UserOrderModel.fromJson(Map<String, dynamic> json) => UserOrderModel(
        kullaniciId: json["KullaniciID"],
        menuFiyatId: json["MenuFiyatID"],
        fiyat: json["Fiyat"],
        indirim: json["Indirim"],
        indirimTipiFiyat: json["IndirimTipiFiyat"],
        siparisTarihi: json["SiparisTarihi"] == null
            ? null
            : DateTime.parse(json["SiparisTarihi"]),
        enlem: json["Enlem"],
        boylam: json["Boylam"],
      );

  Map<String, dynamic> toJson() => {
        "KullaniciID": kullaniciId,
        "MenuFiyatID": menuFiyatId,
        "Fiyat": fiyat,
        "Indirim": indirim,
        "IndirimTipiFiyat": indirimTipiFiyat,
        "SiparisTarihi":
            "${siparisTarihi!.year.toString().padLeft(4, '0')}-${siparisTarihi!.month.toString().padLeft(2, '0')}-${siparisTarihi!.day.toString().padLeft(2, '0')}",
        "Enlem": enlem,
        "Boylam": boylam,
      };
}
