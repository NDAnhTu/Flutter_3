import 'dart:convert';

List<Detail> detailFromJson(String str) =>
    List<Detail>.from(json.decode(str).map((x) => Detail.fromJson(x)));

String detailToJson(List<Detail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Detail {
  Detail({
    required this.name,
    required this.address,
    required this.maxavien,
    required this.visinh,
    required this.vatsua,
    required this.mangthai,
    required this.haubi,
    required this.id,
  });

  String name;
  String address;
  String maxavien;
  int visinh;
  int vatsua;
  int mangthai;
  int haubi;
  String id;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        name: json["name"],
        address: json["address"],
        maxavien: json["maxavien"],
        visinh: json["visinh"],
        vatsua: json["vatsua"],
        mangthai: json["mangthai"],
        haubi: json["haubi"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "maxavien": maxavien,
        "visinh": visinh,
        "vatsua": vatsua,
        "mangthai": mangthai,
        "haubi": haubi,
        "id": id,
      };
}
