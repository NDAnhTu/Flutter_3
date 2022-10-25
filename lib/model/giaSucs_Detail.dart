class GiaSucDetail {
  var sinhSan;
  var tinhTrangSinhSan;
  var trongLuong;
  var gioiTinh;
  var idMe;
  var namTuoi;
  var tinhTrangChoSua;
  var theHe;
  var sauSinh;
  var soTaiMe;
  var giong;
  var id;
  var tuanVatSua;
  var tinhCha;
  var tenNongDan;
  var soLanPhoi;
  var soLanSinhCon;
  var dtt;
  var tbSua;
  var chuKiSinhSan;
  var soNgaySinhSan;
  var soLanSayThai;
  var soNgayVatSua;
  var diaChi;
  var soTai;

  GiaSucDetail(
      {this.sinhSan,
      this.tinhTrangSinhSan,
      this.trongLuong,
      this.gioiTinh,
      this.idMe,
      this.namTuoi,
      this.tinhTrangChoSua,
      this.theHe,
      this.sauSinh,
      this.soTaiMe,
      this.giong,
      this.id,
      this.tuanVatSua,
      this.tinhCha,
      this.tenNongDan,
      this.soLanPhoi,
      this.soLanSinhCon,
      this.dtt,
      this.tbSua,
      this.chuKiSinhSan,
      this.soNgaySinhSan,
      this.soLanSayThai,
      this.soNgayVatSua,
      this.diaChi,
      this.soTai});

  GiaSucDetail.fromJson(Map<String, dynamic> json) {
    sinhSan = json['sinh_san'];
    tinhTrangSinhSan = json['tinh_trang_sinh_san'];
    trongLuong = json['trong_luong'];
    gioiTinh = json['gioi_tinh'];
    idMe = json['id_me'];
    namTuoi = json['nam_tuoi'];
    tinhTrangChoSua = json['tinh_trang_cho_sua'];
    theHe = json['the_he'];
    sauSinh = json['sau_sinh'];
    soTaiMe = json['so_tai_me'];
    giong = json['giong'];
    id = json['id'];
    tuanVatSua = json['tuan_vat_sua'];
    tinhCha = json['tinh_cha'];
    tenNongDan = json['ten_nong_dan'];
    soLanPhoi = json['so_lan_phoi'];
    soLanSinhCon = json['so_lan_sinh_con'];
    dtt = json['dtt'];
    tbSua = json['tb_sua'];
    chuKiSinhSan = json['chu_ki_sinh_san'];
    soNgaySinhSan = json['so_ngay_sinh_san'];
    soLanSayThai = json['so_lan_say_thai'];
    soNgayVatSua = json['so_ngay_vat_sua'];
    diaChi = json['dia_chi'];
    soTai = json['so_tai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sinh_san'] = this.sinhSan;
    data['tinh_trang_sinh_san'] = this.tinhTrangSinhSan;
    data['trong_luong'] = this.trongLuong;
    data['gioi_tinh'] = this.gioiTinh;
    data['id_me'] = this.idMe;
    data['nam_tuoi'] = this.namTuoi;
    data['tinh_trang_cho_sua'] = this.tinhTrangChoSua;
    data['the_he'] = this.theHe;
    data['sau_sinh'] = this.sauSinh;
    data['so_tai_me'] = this.soTaiMe;
    data['giong'] = this.giong;
    data['id'] = this.id;
    data['tuan_vat_sua'] = this.tuanVatSua;
    data['tinh_cha'] = this.tinhCha;
    data['ten_nong_dan'] = this.tenNongDan;
    data['so_lan_phoi'] = this.soLanPhoi;
    data['so_lan_sinh_con'] = this.soLanSinhCon;
    data['dtt'] = this.dtt;
    data['tb_sua'] = this.tbSua;
    data['chu_ki_sinh_san'] = this.chuKiSinhSan;
    data['so_ngay_sinh_san'] = this.soNgaySinhSan;
    data['so_lan_say_thai'] = this.soLanSayThai;
    data['so_ngay_vat_sua'] = this.soNgayVatSua;
    data['dia_chi'] = this.diaChi;
    data['so_tai'] = this.soTai;
    return data;
  }
}
