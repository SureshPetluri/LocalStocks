import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    this.id,
    this.name,
    this.url,
    this.imgUrl,
    this.brand,
    this.manufacturer,
    this.sku,
    this.condition,
    this.price,
    this.description,
    this.keywords,
    this.status,
    this.vendorId,
    this.categories,
  });

  int? id;
  String? name;
  String? url;
  String? imgUrl;
  String? brand;
  String? manufacturer;
  String? sku;
  String? condition;
  int? price;
  String? description;
  String? keywords;
  String? status;
  int? vendorId;
  List<Category>? categories;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    url: json["url"] ?? "",
    imgUrl: json["imgUrl"] ?? "",
    brand: json["brand"] ?? "",
    manufacturer: json["manufacturer"] ?? "",
    sku: json["sku"] ?? "",
    condition: json["condition"] ?? "",
    price: json["price"] ?? 0,
    description: json["description"] ?? "",
    keywords: json["keywords"] ?? "",
    status: json["status"] ?? "",
    vendorId: json["vendorId"] ?? 0,
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
    "imgUrl": imgUrl,
    "brand": brand,
    "manufacturer": manufacturer,
    "sku": sku,
    "condition": condition,
    "price": price,
    "description": description,
    "keywords": keywords,
    "status": status,
    "vendorId": vendorId,
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.status,
  });

  int? id;
  String? name;
  String? status;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    status: json["status"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
  };
}
