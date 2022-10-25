class GiaSuc {
  String? sinhsan;
  int? tinhtrangsinhsan;
  String? tennongdan;
  double? trongluong;
  double? dtt;
  bool? gioitinh;
  int? luasinh;
  int? id;
  int? songaysinhsan;
  String? sotai;
  double? namtuoi;

  GiaSuc(
      {this.sinhsan,
      this.tinhtrangsinhsan,
      this.tennongdan,
      this.trongluong,
      this.dtt,
      this.gioitinh,
      this.luasinh,
      this.id,
      this.songaysinhsan,
      this.sotai,
      this.namtuoi});

  GiaSuc.fromJson(Map<String, dynamic> json) {
    sinhsan = json['sinh_san'];
    tinhtrangsinhsan = json['tinh_trang_sinh_san'];
    tennongdan = json['ten_nong_dan'];
    trongluong = json['trong_luong'];
    dtt = json['dtt'];
    gioitinh = json['gioi_tinh'];
    luasinh = json['lua_sinh'];
    id = json['id'];
    songaysinhsan = json['so_ngay_sinh_san'];
    sotai = json['so_tai'];
    namtuoi = json['nam_tuoi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sinh_san'] = sinhsan;
    data['tinh_trang_sinh_san'] = tinhtrangsinhsan;
    data['ten_nong_dan'] = tennongdan;
    data['trong_luong'] = trongluong;
    data['dtt'] = dtt;
    data['gioi_tinh'] = gioitinh;
    data['lua_sinh'] = luasinh;
    data['id'] = id;
    data['so_ngay_sinh_san'] = songaysinhsan;
    data['so_tai'] = sotai;
    data['nam_tuoi'] = namtuoi;
    return data;
  }
}
