// To parse this JSON data, do
//
//     final subCategoryListResponse = subCategoryListResponseFromJson(jsonString);

import 'dart:convert';

SubCategoryListResponse subCategoryListResponseFromJson(String str) => SubCategoryListResponse.fromJson(json.decode(str));

String subCategoryListResponseToJson(SubCategoryListResponse data) => json.encode(data.toJson());

class SubCategoryListResponse {
  bool? status;
  String? message;
  List<SubCategoryData>? data;

  SubCategoryListResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SubCategoryListResponse.fromJson(Map<String, dynamic> json) => SubCategoryListResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SubCategoryData>.from(json["data"]!.map((x) => SubCategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SubCategoryData {
  String? id;
  String? categoryId;
  String? subCategoryName;
  String? subCategorySlug;
  String? subCategoryImage;
  String? createdAt;
  String? showOnOff;
  String? status;
  String? categoryName;

  SubCategoryData({
    this.id,
    this.categoryId,
    this.subCategoryName,
    this.subCategorySlug,
    this.subCategoryImage,
    this.createdAt,
    this.showOnOff,
    this.status,
    this.categoryName,
  });

  factory SubCategoryData.fromJson(Map<String, dynamic> json) => SubCategoryData(
    id: json["id"],
    categoryId: json["category_id"],
    subCategoryName: json["sub_category_name"],
    subCategorySlug: json["sub_category_slug"],
    subCategoryImage: json["sub_category_image"],
    createdAt: json["created_at"],
    showOnOff: json["show_on_off"],
    status: json["status"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "sub_category_name": subCategoryName,
    "sub_category_slug": subCategorySlug,
    "sub_category_image": subCategoryImage,
    "created_at": createdAt,
    "show_on_off": showOnOff,
    "status": status,
    "category_name": categoryName,
  };
}
