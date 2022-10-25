class AuthUser {
  final String accessToken;
  final String tokenType;

  AuthUser({required this.accessToken, required this.tokenType});

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
        accessToken: json['accessToken'], tokenType: json['tokenType']);
  }
}

class CurrentUser {
  final int id;
  final int status;
  final String ten;
  final String email;
  final String dia_chi;
  final int level;
  final String name;
  final String image_url;
  final int app_role;
  final String provider;

  CurrentUser(
      {required this.id,
      required this.status,
      required this.ten,
      required this.email,
      required this.dia_chi,
      required this.level,
      required this.name,
      required this.image_url,
      required this.app_role,
      required this.provider});

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      id: json['id'],
      status: json['status'],
      ten: json['ten'],
      email: json['email'],
      dia_chi: json['dia-chi'],
      level: json['level'],
      name: json['name'],
      image_url: json['image_url'],
      app_role: json['app_role'],
      provider: json['provider'],
    );
  }
}
