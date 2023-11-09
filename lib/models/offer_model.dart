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
