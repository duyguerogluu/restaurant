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

class LoginModel {
  bool? isError;
  String? errorMsg;
  int? iD;
  String? adi;
  String? soyadi;
  String? telefon;
  String? email;
  String? sifre;
  bool? yetkili;
  String? yetkiDurum;

  LoginModel(
      {this.isError,
      this.errorMsg,
      this.iD,
      this.adi,
      this.soyadi,
      this.telefon,
      this.email,
      this.sifre,
      this.yetkili,
      this.yetkiDurum});

  LoginModel.fromJson(Map<String, dynamic> json) {
    isError = json['isError'];
    errorMsg = json['errorMsg'];
    iD = json['ID'];
    adi = json['Adi'];
    soyadi = json['Soyadi'];
    telefon = json['Telefon'];
    email = json['Email'];
    sifre = json['Sifre'];
    yetkili = json['Yetkili'];
    yetkiDurum = json['YetkiDurum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isError'] = isError;
    data['errorMsg'] = errorMsg;
    data['ID'] = iD;
    data['Adi'] = adi;
    data['Soyadi'] = soyadi;
    data['Telefon'] = telefon;
    data['Email'] = email;
    data['Sifre'] = sifre;
    data['Yetkili'] = yetkili;
    data['YetkiDurum'] = yetkiDurum;
    return data;
  }
}
