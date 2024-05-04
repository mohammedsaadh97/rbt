// To parse this JSON data, do
//
//     final subcategoryDetailsResponse = subcategoryDetailsResponseFromJson(jsonString);

import 'dart:convert';

SubcategoryDetailsResponse subcategoryDetailsResponseFromJson(String str) => SubcategoryDetailsResponse.fromJson(json.decode(str));

String subcategoryDetailsResponseToJson(SubcategoryDetailsResponse data) => json.encode(data.toJson());

class SubcategoryDetailsResponse {
  bool? status;
  String? message;
  List<SubcategoryDetailsData>? data;

  SubcategoryDetailsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SubcategoryDetailsResponse.fromJson(Map<String, dynamic> json) => SubcategoryDetailsResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SubcategoryDetailsData>.from(json["data"]!.map((x) => SubcategoryDetailsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SubcategoryDetailsData {
  String? id;
  String? categoryId;
  String? subCategoryId;
  String? multiSubCategoryName;
  String? multiSubCategorySlug;
  String? multiSubCategoryImage;
  String? createdAt;
  String? showOnOf;
  String? status;
  String? parentId;
  String? childId;
  String? isChild;
  String? isChild1;
  String? subCategoryName;

  SubcategoryDetailsData({
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.multiSubCategoryName,
    this.multiSubCategorySlug,
    this.multiSubCategoryImage,
    this.createdAt,
    this.showOnOf,
    this.status,
    this.parentId,
    this.childId,
    this.isChild,
    this.isChild1,
    this.subCategoryName,
  });

  factory SubcategoryDetailsData.fromJson(Map<String, dynamic> json) => SubcategoryDetailsData(
    id: json["id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    multiSubCategoryName: json["multi_sub_category_name"],
    multiSubCategorySlug: json["multi_sub_category_slug"],
    multiSubCategoryImage: json["multi_sub_category_image"],
    createdAt: json["created_at"],
    showOnOf: json["show_on_of"],
    status: json["status"],
    parentId: json["parent_id"],
    childId: json["child_id"],
    isChild: json["is_child"],
    isChild1: json["is_child1"],
    subCategoryName: json["sub_category_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "multi_sub_category_name": multiSubCategoryName,
    "multi_sub_category_slug": multiSubCategorySlug,
    "multi_sub_category_image": multiSubCategoryImage,
    "created_at": createdAt,
    "show_on_of": showOnOf,
    "status": status,
    "parent_id": parentId,
    "child_id": childId,
    "is_child": isChild,
    "is_child1": isChild1,
    "sub_category_name": subCategoryName,
  };
}
