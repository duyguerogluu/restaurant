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
//     final AnnouncementModel = AnnouncementModelFromJson(jsonString);

import 'dart:convert';

AnnouncementModel AnnouncementModelFromJson(String str) =>
    AnnouncementModel.fromJson(json.decode(str));

String AnnouncementModelToJson(AnnouncementModel data) =>
    json.encode(data.toJson());

class AnnouncementModel {
  int? id;
  String? baslik;
  String? aciklama;
  bool? bireysel;
  bool? bildiri;
  int? kullaniciId;
  String? bireyselDurum;
  String? bildiriDurum;
  dynamic adi;
  dynamic soyadi;

  AnnouncementModel({
    this.id,
    this.baslik,
    this.aciklama,
    this.bireysel,
    this.bildiri,
    this.kullaniciId,
    this.bireyselDurum,
    this.bildiriDurum,
    this.adi,
    this.soyadi,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) =>
      AnnouncementModel(
        id: json["ID"],
        baslik: json["Baslik"],
        aciklama: json["Aciklama"],
        bireysel: json["Bireysel"],
        bildiri: json["Bildiri"],
        kullaniciId: json["KullaniciID"],
        bireyselDurum: json["BireyselDurum"],
        bildiriDurum: json["BildiriDurum"],
        adi: json["Adi"],
        soyadi: json["Soyadi"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Baslik": baslik,
        "Aciklama": aciklama,
        "Bireysel": bireysel,
        "Bildiri": bildiri,
        "KullaniciID": kullaniciId,
        "BireyselDurum": bireyselDurum,
        "BildiriDurum": bildiriDurum,
        "Adi": adi,
        "Soyadi": soyadi,
      };
}
