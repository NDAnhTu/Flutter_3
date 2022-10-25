class ChoSua {
  int? giasucid;
  String? sotai;
  int? tinhtrangsinhsan;
  int? lanphoi;
  String? ngayphoi;
  int? nguoiphoi;
  int? sauphoi;
  int? saude;
  int? nongdanid;
  String? tennongdan;
  String? diachi;

  ChoSua(
      {this.giasucid,
      this.sotai,
      this.tinhtrangsinhsan,
      this.lanphoi,
      this.ngayphoi,
      this.nguoiphoi,
      this.sauphoi,
      this.saude,
      this.nongdanid,
      this.tennongdan,
      this.diachi});

  ChoSua.fromJson(Map<String, dynamic> json) {
    giasucid = json['gia_suc_id'];
    sotai = json['so_tai'];
    tinhtrangsinhsan = json['tinh_trang_sinh_san'];
    lanphoi = json['lan_phoi'];
    ngayphoi = json['ngay_phoi'];
    nguoiphoi = json['nguoi_phoi'];
    sauphoi = json['sau_phoi'];
    saude = json['sau_de'];
    nongdanid = json['nong_dan_id'];
    tennongdan = json['ten_nong_dan'];
    diachi = json['dia_chi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['gia_suc_id'] = giasucid;
    data['so_tai'] = sotai;
    data['tinh_trang_sinh_san'] = tinhtrangsinhsan;
    data['lan_phoi'] = lanphoi;
    data['ngay_phoi'] = ngayphoi;
    data['nguoi_phoi'] = nguoiphoi;
    data['sau_phoi'] = sauphoi;
    data['sau_de'] = saude;
    data['nong_dan_id'] = nongdanid;
    data['ten_nong_dan'] = tennongdan;
    data['dia_chi'] = diachi;
    return data;
  }
}
