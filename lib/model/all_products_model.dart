import 'dart:convert';

GetAllProductsModel getAllProductsFromJson(String str) =>
    GetAllProductsModel.fromJson(json.decode(str));

String getAllProductsToJson(GetAllProductsModel data) =>
    json.encode(data.toJson());

class GetAllProductsModel {
  GetAllProductsModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  dynamic message;
  List<Datum>? data;

  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) =>
      GetAllProductsModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
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
  double? price;
  String? description;
  String? keywords;
  String? status;
  int? vendorId;
  List<Category>? categories;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    imgUrl: json["imgUrl"],
    brand: json["brand"],
    manufacturer: json["manufacturer"],
    sku: json["sku"],
    condition: json["condition"],
    price: json["price"],
    description: json["description"],
    keywords: json["keywords"],
    status: json["status"],
    vendorId: json["vendorId"],
    categories: List<Category>.from(
        json["categories"].map((x) => Category.fromJson(x))),
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
    id: json["id"],
    name: json["name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
  };
}
