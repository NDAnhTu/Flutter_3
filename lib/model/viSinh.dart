class ViSinh {
  double? diemdong;
  double? visinh;
  String? ngay;
  double? kho;
  String? buoi;
  int? id;
  double? titrong;
  double? beo;

  ViSinh(
      {this.diemdong,
      this.visinh,
      this.ngay,
      this.kho,
      this.buoi,
      this.id,
      this.titrong,
      this.beo});

  ViSinh.fromJson(Map<String, dynamic> json) {
    diemdong = json['diem_dong'];
    visinh = json['vi_sinh'];
    ngay = json['ngay'];
    kho = json['kho'];
    buoi = json['buoi'];
    id = json['id'];
    titrong = json['ti_trong'];
    beo = json['beo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['diem_dong'] = diemdong;
    data['vi_sinh'] = visinh;
    data['ngay'] = ngay;
    data['kho'] = kho;
    data['buoi'] = buoi;
    data['id'] = id;
    data['ti_trong'] = titrong;
    data['beo'] = beo;
    return data;
  }
}
