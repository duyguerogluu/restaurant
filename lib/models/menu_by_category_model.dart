// To parse this JSON data, do
//
//     final menuByCategoryModel = menuByCategoryModelFromJson(jsonString);

import 'dart:convert';

MenuByCategoryModel menuByCategoryModelFromJson(String str) => MenuByCategoryModel.fromJson(json.decode(str));

String menuByCategoryModelToJson(MenuByCategoryModel data) => json.encode(data.toJson());

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

    factory MenuByCategoryModel.fromJson(Map<String, dynamic> json) => MenuByCategoryModel(
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
