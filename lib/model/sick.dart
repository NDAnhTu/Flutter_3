class Sick {
  var id;
  var status;
  String? ten;

  Sick({this.id, this.status, this.ten});

  Sick.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    ten = json['ten'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['ten'] = this.ten;
    return data;
  }
}
