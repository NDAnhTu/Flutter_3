class VatSua {
  double? thucchieu;
  double? thucsang;
  String? ngay;
  int? id;
  double? tongsua;

  VatSua({this.thucchieu, this.thucsang, this.ngay, this.id, this.tongsua});

  VatSua.fromJson(Map<String, dynamic> json) {
    thucchieu = json['thuc_chieu'];
    thucsang = json['thuc_sang'];
    ngay = json['ngay'];
    id = json['id'];
    tongsua = json['tong_sua'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['thuc_chieu'] = thucchieu;
    data['thuc_sang'] = thucsang;
    data['ngay'] = ngay;
    data['id'] = id;
    data['tong_sua'] = tongsua;
    return data;
  }
}
