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
//     final offerModel = offerModelFromJson(jsonString);

import 'dart:convert';

OfferModel offerModelFromJson(String str) =>
    OfferModel.fromJson(json.decode(str));

String offerModelToJson(OfferModel data) => json.encode(data.toJson());

class OfferModel {
  int? id;
  String? baslik;
  String? aciklama;
  DateTime? baslangicTarihi;
  DateTime? bitisTarihi;

  OfferModel({
    this.id,
    this.baslik,
    this.aciklama,
    this.baslangicTarihi,
    this.bitisTarihi,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        id: json["ID"],
        baslik: json["Baslik"],
        aciklama: json["Aciklama"],
        baslangicTarihi: json["BaslangicTarihi"] == null
            ? null
            : DateTime.parse(json["BaslangicTarihi"]),
        bitisTarihi: json["BitisTarihi"] == null
            ? null
            : DateTime.parse(json["BitisTarihi"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Baslik": baslik,
        "Aciklama": aciklama,
        "BaslangicTarihi": baslangicTarihi?.toIso8601String(),
        "BitisTarihi": bitisTarihi?.toIso8601String(),
      };
}
