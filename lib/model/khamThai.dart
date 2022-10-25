class KhamThai {
  int? giasucid;
  String? sotai;
  int? tinhtrangsinhsan;
  int? lanphoi;
  String? ngayphoi;
  int? nguoiphoi;
  int? sauphoi;
  int? nongdanid;
  String? tennongdan;
  String? diachi;

  KhamThai(
      {this.giasucid,
      this.sotai,
      this.tinhtrangsinhsan,
      this.lanphoi,
      this.ngayphoi,
      this.nguoiphoi,
      this.sauphoi,
      this.nongdanid,
      this.tennongdan,
      this.diachi});

  KhamThai.fromJson(Map<String, dynamic> json) {
    giasucid = json['gia_suc_id'];
    sotai = json['so_tai'];
    tinhtrangsinhsan = json['tinh_trang_sinh_san'];
    lanphoi = json['lan_phoi'];
    ngayphoi = json['ngay_phoi'];
    nguoiphoi = json['nguoi_phoi'];
    sauphoi = json['sau_phoi'];
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
    data['nong_dan_id'] = nongdanid;
    data['ten_nong_dan'] = tennongdan;
    data['dia_chi'] = diachi;
    return data;
  }
}
