
class CategoriesModels {
  CategoriesModels({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.imageUrl,
  });

  int id;
  String name;
  String status;
  DateTime createdAt;
  String imageUrl;

  factory CategoriesModels.fromJson(Map<String, dynamic> json) => CategoriesModels(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "image_url": imageUrl,
  };
}







