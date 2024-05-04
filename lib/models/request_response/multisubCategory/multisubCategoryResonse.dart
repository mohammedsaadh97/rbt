// To parse this JSON data, do
//
//     final multisubcategoryDetailsResponse = multisubcategoryDetailsResponseFromJson(jsonString);

import 'dart:convert';

MultisubcategoryDetailsResponse multisubcategoryDetailsResponseFromJson(String str) => MultisubcategoryDetailsResponse.fromJson(json.decode(str));

String multisubcategoryDetailsResponseToJson(MultisubcategoryDetailsResponse data) => json.encode(data.toJson());

class MultisubcategoryDetailsResponse {
  bool? status;
  String? message;
  List<MultisubcategoryDetailsData>? data;

  MultisubcategoryDetailsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory MultisubcategoryDetailsResponse.fromJson(Map<String, dynamic> json) => MultisubcategoryDetailsResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<MultisubcategoryDetailsData>.from(json["data"]!.map((x) => MultisubcategoryDetailsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class MultisubcategoryDetailsData {
  String? id;
  String? categoryId;
  String? subCategoryId;
  String? multiSubCategoryId;
  String? multiTwoSubCategoryName;
  String? multiTwoSubCategorySlug;
  String? multiTwoSubCategoryImage;
  String? createdAt;
  String? showOnOf;
  String? status;
  String? parentId;
  String? childId;
  String? isChild;
  String? isChild1;
  String? multiSubCategoryName;

  MultisubcategoryDetailsData({
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.multiSubCategoryId,
    this.multiTwoSubCategoryName,
    this.multiTwoSubCategorySlug,
    this.multiTwoSubCategoryImage,
    this.createdAt,
    this.showOnOf,
    this.status,
    this.parentId,
    this.childId,
    this.isChild,
    this.isChild1,
    this.multiSubCategoryName,
  });

  factory MultisubcategoryDetailsData.fromJson(Map<String, dynamic> json) => MultisubcategoryDetailsData(
    id: json["id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    multiSubCategoryId: json["multi_sub_category_id"],
    multiTwoSubCategoryName: json["multi_two_sub_category_name"],
    multiTwoSubCategorySlug: json["multi_two_sub_category_slug"],
    multiTwoSubCategoryImage: json["multi_two_sub_category_image"],
    createdAt: json["created_at"],
    showOnOf: json["show_on_of"],
    status: json["status"],
    parentId: json["parent_id"],
    childId: json["child_id"],
    isChild: json["is_child"],
    isChild1: json["is_child1"],
    multiSubCategoryName: json["multi_sub_category_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "multi_sub_category_id": multiSubCategoryId,
    "multi_two_sub_category_name": multiTwoSubCategoryName,
    "multi_two_sub_category_slug": multiTwoSubCategorySlug,
    "multi_two_sub_category_image": multiTwoSubCategoryImage,
    "created_at": createdAt,
    "show_on_of": showOnOf,
    "status": status,
    "parent_id": parentId,
    "child_id": childId,
    "is_child": isChild,
    "is_child1": isChild1,
    "multi_sub_category_name": multiSubCategoryName,
  };
}
