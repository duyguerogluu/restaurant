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
//     final menuByCategoryModel = menuByCategoryModelFromJson(jsonString);

import 'dart:convert';

MenuByCategoryModel menuByCategoryModelFromJson(String str) =>
    MenuByCategoryModel.fromJson(json.decode(str));

String menuByCategoryModelToJson(MenuByCategoryModel data) =>
    json.encode(data.toJson());

class MenuByCategoryModel {
  int? id;
  int? kategoriId;
  String? baslik;
  String? icerik;
  String? resimYolu;
  String? kategoriAdi;
  String? boyut;
  double? fiyat;
  double? indirim;
  double? indirimTipiFiyat;

  MenuByCategoryModel({
    this.id,
    this.kategoriId,
    this.baslik,
    this.icerik,
    this.resimYolu,
    this.kategoriAdi,
    this.boyut,
    this.fiyat,
    this.indirim,
    this.indirimTipiFiyat,
  });

  factory MenuByCategoryModel.fromJson(Map<String, dynamic> json) =>
      MenuByCategoryModel(
        id: json["ID"],
        kategoriId: json["KategoriID"],
        baslik: json["Baslik"],
        icerik: json["Icerik"],
        resimYolu: json["ResimYolu"],
        kategoriAdi: json["KategoriAdi"],
        boyut: json["Boyut"],
        fiyat: json["fiyat"],
        indirim: json["Indirim"],
        indirimTipiFiyat: json["IndirimTipiFiyat"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "KategoriID": kategoriId,
        "Baslik": baslik,
        "Icerik": icerik,
        "ResimYolu": resimYolu,
        "KategoriAdi": kategoriAdi,
        "Boyut": boyut,
        "fiyat": fiyat,
        "Indirim": indirim,
        "IndirimTipiFiyat": indirimTipiFiyat,
      };
}
