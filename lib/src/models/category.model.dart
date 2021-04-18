class Categoria {
  Categoria({
    this.categoryId,
    this.name,
    this.description,
    this.parent,
    this.externId,
    this.storeId,
    this.slug,
    this.externType,
    this.imageId,
    this.lastModificationDate,
    this.creationDate,
    this.imageUrl,
  });

  int categoryId;
  String name;
  String description;
  int parent;
  int externId;
  int storeId;
  String slug;
  String externType;
  int imageId;
  dynamic lastModificationDate;
  DateTime creationDate;
  dynamic imageUrl;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        categoryId: json["category_id"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        parent: json["parent"] ?? '',
        externId: json["extern_id"] ?? '',
        storeId: json["store_id"] ?? '',
        slug: json["slug"] ?? '',
        externType: json["extern_type"] ?? '',
        imageId: json["image_id"] ?? '',
        lastModificationDate: json["last_modification_date"] ?? '',
        creationDate: DateTime.parse(json["creation_date"]) ?? '',
        imageUrl: json["image_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
        "description": description,
        "parent": parent,
        "extern_id": externId,
        "store_id": storeId,
        "slug": slug,
        "extern_type": externType,
        "image_id": imageId,
        "last_modification_date": lastModificationDate,
        "creation_date": creationDate.toIso8601String(),
        "image_url": imageUrl,
      };
}
