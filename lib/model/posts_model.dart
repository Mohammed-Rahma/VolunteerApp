class PostsModel {
  PostsModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.location,
    required this.status,
    required this.createdAt,
    required this.imageUrl,
    required this.category,
  });

  int id;
  int categoryId;
  String title;
  String description;
  String location;
  String status;
  String createdAt;
  String imageUrl;
  Category category;


  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        id: json["id"],
        categoryId: json["category_id"],
        title: json["title"],
        description: json["description"],
        location: json["location"],
        status: json["status"],
        createdAt: json["created_at"],
        imageUrl: json["image_url"],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "title": title,
        "description": description,
        "location": location,
        "status": status,
        "created_at": createdAt,
        "image_url": imageUrl,
        "category": category.toJson(),
      };
}

class Category {
  Category({
    required this.name,
    this.imageUrl,
  });

  String name;
  dynamic imageUrl;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image_url": imageUrl,
      };
}
