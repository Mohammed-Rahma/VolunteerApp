class Instituation {
  late int id;
  late  String name;
  late String description;
  late String email;
  late Null emailVerifiedAt;
  late String password;
  late  Null rememberToken;
  late int active;
  late String createdAt;
  late String updatedAt;
  late String imageLogo;
  late String imageCover;

  Instituation();

  Instituation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageLogo = json['image_logo'];
    imageCover = json['image_cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_logo'] = this.imageLogo;
    data['image_cover'] = this.imageCover;
    return data;
  }
}