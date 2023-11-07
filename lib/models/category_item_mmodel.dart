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
