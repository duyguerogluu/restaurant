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

class CategoryItemModel {
  int? id;
  int? ustKategoriId;
  String? adi;
  String? resimYolu;
  dynamic ustKategoriAdi;

  CategoryItemModel({
    this.id,
    this.ustKategoriId,
    this.adi,
    this.resimYolu,
    this.ustKategoriAdi,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      CategoryItemModel(
        id: json["ID"],
        ustKategoriId: json["UstKategoriID"],
        adi: json["Adi"],
        resimYolu: json["ResimYolu"],
        ustKategoriAdi: json["UstKategoriAdi"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "UstKategoriID": ustKategoriId,
        "Adi": adi,
        "ResimYolu": resimYolu,
        "UstKategoriAdi": ustKategoriAdi,
      };
}
