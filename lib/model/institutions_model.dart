
class InstitutionsModel {
  InstitutionsModel({
    required this.id,
    required this.name,
    required this.coverImage,
    required this.logoImage,
    required this.description,
    required this.email,
    required this.emailVerifiedAt,
    required this.password,
    required this.rememberToken,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String coverImage;
  String logoImage;
  String description;
  String email;
  dynamic emailVerifiedAt;
  String password;
  dynamic rememberToken;
  int active;
  DateTime createdAt;
  DateTime updatedAt;

  factory InstitutionsModel.fromJson(Map<String, dynamic> json) => InstitutionsModel(
    id: json["id"],
    name: json["name"],
    coverImage: json["cover_image"],
    logoImage: json["logo_image"],
    description: json["description"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"],
    rememberToken: json["remember_token"],
    active: json["active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "cover_image": coverImage,
    "logo_image": logoImage,
    "description": description,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "remember_token": rememberToken,
    "active": active,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
