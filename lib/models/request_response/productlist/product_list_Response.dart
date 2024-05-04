// To parse this JSON data, do
//
//     final productListResponse = productListResponseFromJson(jsonString);

import 'dart:convert';

ProductListResponse productListResponseFromJson(String str) => ProductListResponse.fromJson(json.decode(str));

String productListResponseToJson(ProductListResponse data) => json.encode(data.toJson());

class ProductListResponse {
  bool? status;
  String? message;
  List<ProductListData>? data;

  ProductListResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) => ProductListResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ProductListData>.from(json["data"]!.map((x) => ProductListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ProductListData {
  String? id;
  String? categoryId;
  String? subCategoryId;
  String? multiSubCategoryId;
  String? multiTwoSubCategoryId;
  String? brandId;
  String? offerId;
  String? productTitle;
  String? productSlug;
  String? productDesc;
  String? productFeatures;
  String? featuredImage;
  String? featuredImage2;
  String? sizeChart;
  String? productMrp;
  String? sellingPrice;
  String? youSaveAmt;
  String? youSavePer;
  String? otherColorProduct;
  String? color;
  String? productSize;
  String? productQuantity;
  String? maxUnitBuy;
  String? deliveryCharge;
  String? totalViews;
  String? totalRate;
  String? rateAvg;
  String? isFeatured;
  String? todayDeal;
  String? todayDealDate;
  String? totalSale;
  String? createdAt;
  String? seoTitle;
  String? seoMetaDescription;
  String? seoKeywords;
  String? status;
  String? oePartNo;
  String? bearingNo;
  String? modelId;
  String? categoryName;
  String? subCategoryName;
  String? datumSeoMetaDescription;
  String? datumSeoKeywords;

  ProductListData({
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.multiSubCategoryId,
    this.multiTwoSubCategoryId,
    this.brandId,
    this.offerId,
    this.productTitle,
    this.productSlug,
    this.productDesc,
    this.productFeatures,
    this.featuredImage,
    this.featuredImage2,
    this.sizeChart,
    this.productMrp,
    this.sellingPrice,
    this.youSaveAmt,
    this.youSavePer,
    this.otherColorProduct,
    this.color,
    this.productSize,
    this.productQuantity,
    this.maxUnitBuy,
    this.deliveryCharge,
    this.totalViews,
    this.totalRate,
    this.rateAvg,
    this.isFeatured,
    this.todayDeal,
    this.todayDealDate,
    this.totalSale,
    this.createdAt,
    this.seoTitle,
    this.seoMetaDescription,
    this.seoKeywords,
    this.status,
    this.oePartNo,
    this.bearingNo,
    this.modelId,
    this.categoryName,
    this.subCategoryName,
    this.datumSeoMetaDescription,
    this.datumSeoKeywords,
  });

  factory ProductListData.fromJson(Map<String, dynamic> json) => ProductListData(
    id: json["id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    multiSubCategoryId: json["multi_sub_category_id"],
    multiTwoSubCategoryId: json["multi_two_sub_category_id"],
    brandId: json["brand_id"],
    offerId: json["offer_id"],
    productTitle: json["product_title"],
    productSlug: json["product_slug"],
    productDesc: json["product_desc"],
    productFeatures: json["product_features"],
    featuredImage: json["featured_image"],
    featuredImage2: json["featured_image2"],
    sizeChart: json["size_chart"],
    productMrp: json["product_mrp"],
    sellingPrice: json["selling_price"],
    youSaveAmt: json["you_save_amt"],
    youSavePer: json["you_save_per"],
    otherColorProduct: json["other_color_product"],
    color: json["color"],
    productSize: json["product_size"],
    productQuantity: json["product_quantity"],
    maxUnitBuy: json["max_unit_buy"],
    deliveryCharge: json["delivery_charge"],
    totalViews: json["total_views"],
    totalRate: json["total_rate"],
    rateAvg: json["rate_avg"],
    isFeatured: json["is_featured"],
    todayDeal: json["today_deal"],
    todayDealDate: json["today_deal_date"],
    totalSale: json["total_sale"],
    createdAt: json["created_at"],
    seoTitle: json["seo_title"],
    seoMetaDescription: json[" seo_meta_description"],
    seoKeywords: json[" seo_keywords"],
    status: json["status"],
    oePartNo: json["oe_part_no"],
    bearingNo: json["bearing_no"],
    modelId: json["model_id"],
    categoryName: json["category_name"],
    subCategoryName: json["sub_category_name"],
    datumSeoMetaDescription: json["seo_meta_description"],
    datumSeoKeywords: json["seo_keywords"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "multi_sub_category_id": multiSubCategoryId,
    "multi_two_sub_category_id": multiTwoSubCategoryId,
    "brand_id": brandId,
    "offer_id": offerId,
    "product_title": productTitle,
    "product_slug": productSlug,
    "product_desc": productDesc,
    "product_features": productFeatures,
    "featured_image": featuredImage,
    "featured_image2": featuredImage2,
    "size_chart": sizeChart,
    "product_mrp": productMrp,
    "selling_price": sellingPrice,
    "you_save_amt": youSaveAmt,
    "you_save_per": youSavePer,
    "other_color_product": otherColorProduct,
    "color": color,
    "product_size": productSize,
    "product_quantity": productQuantity,
    "max_unit_buy": maxUnitBuy,
    "delivery_charge": deliveryCharge,
    "total_views": totalViews,
    "total_rate": totalRate,
    "rate_avg": rateAvg,
    "is_featured": isFeatured,
    "today_deal": todayDeal,
    "today_deal_date": todayDealDate,
    "total_sale": totalSale,
    "created_at": createdAt,
    "seo_title": seoTitle,
    " seo_meta_description": seoMetaDescription,
    " seo_keywords": seoKeywords,
    "status": status,
    "oe_part_no": oePartNo,
    "bearing_no": bearingNo,
    "model_id": modelId,
    "category_name": categoryName,
    "sub_category_name": subCategoryName,
    "seo_meta_description": datumSeoMetaDescription,
    "seo_keywords": datumSeoKeywords,
  };
}
