class NongDan {
  NongDan({
    this.tenHuyen,
    this.tenNongDan,
    this.sdt,
    this.soGiaSuc,
    this.tenAp,
    this.loai,
    this.id,
    this.quanHeChuHo,
    this.maNongDan,
    this.tenXa,
  });

  String? tenHuyen;
  String? tenNongDan;
  String? sdt;
  int? soGiaSuc;
  String? tenAp;
  String? loai;
  int? id;
  String? quanHeChuHo;
  String? maNongDan;
  String? tenXa;

  NongDan.fromJson(Map<String, dynamic> json) {
    tenHuyen = json["ten_huyen"];
    tenNongDan = json["ten_nong_dan"];
    sdt = json["sdt"];
    soGiaSuc = json["so_gia_suc"];
    tenAp = json["ten_ap"];
    loai = json["loai"];
    id = json["id"];
    quanHeChuHo = json["quan_he_chu_ho"];
    maNongDan = json["ma_nong_dan"];
    tenXa = json["ten_xa"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ten_huyen'] = tenHuyen;
    data['ten_nong_dan'] = tenNongDan;
    data['sdt'] = sdt;
    data['so_gia_suc'] = soGiaSuc;
    data['ten_ap'] = tenAp;
    data['loai'] = loai;
    data['id'] = id;
    data['quan_he_chu_ho'] = quanHeChuHo;
    data['ma_nong_dan'] = maNongDan;
    data['ten_xa'] = tenXa;
    return data;
  }
}
