// To parse this JSON data, do
//
//     final categoryListResponse = categoryListResponseFromJson(jsonString);

import 'dart:convert';

CategoryListResponse categoryListResponseFromJson(String str) => CategoryListResponse.fromJson(json.decode(str));

String categoryListResponseToJson(CategoryListResponse data) => json.encode(data.toJson());

class CategoryListResponse {
  bool? status;
  String? message;
  List<CategoryListData>? data;

  CategoryListResponse({
    this.status,
    this.message,
    this.data,
  });

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) => CategoryListResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<CategoryListData>.from(json["data"]!.map((x) => CategoryListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CategoryListData {
  String? id;
  String? categoryName;
  String? categorySlug;
  String? categoryImage;
  String? productFeatures;
  String? setOnHome;
  String? createdAt;
  String? status;

  CategoryListData({
    this.id,
    this.categoryName,
    this.categorySlug,
    this.categoryImage,
    this.productFeatures,
    this.setOnHome,
    this.createdAt,
    this.status,
  });

  factory CategoryListData.fromJson(Map<String, dynamic> json) => CategoryListData(
    id: json["id"] as String?,
    categoryName: json["category_name"] as String?,
    categorySlug: json["category_slug"] as String?,
    categoryImage: json["category_image"] as String?,
    productFeatures: json["product_features"] as String?,
    setOnHome: json["set_on_home"] as String?,
    createdAt: json["created_at"] as String?,
    status: json["status"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "category_slug": categorySlug,
    "category_image": categoryImage,
    "product_features": productFeatures,
    "set_on_home": setOnHome,
    "created_at": createdAt,
    "status": status,
  };
}
