class CategoryProductResponse {
  bool? status;
  String? message;
  List<CategoryProductData>? data;

  CategoryProductResponse({this.status, this.message, this.data});

  CategoryProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      //data = new List<CategoryProductData>();
      data = <CategoryProductData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryProductData {
  String? id;
  String? categoryId;
  String? subCategoryId;
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

  CategoryProductData(
      {this.id,
        this.categoryId,
        this.subCategoryId,
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
        this.modelId});

  CategoryProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    brandId = json['brand_id'];
    offerId = json['offer_id'];
    productTitle = json['product_title'];
    productSlug = json['product_slug'];
    productDesc = json['product_desc'];
    productFeatures = json['product_features'];
    featuredImage = json['featured_image'];
    featuredImage2 = json['featured_image2'];
    sizeChart = json['size_chart'];
    productMrp = json['product_mrp'];
    sellingPrice = json['selling_price'];
    youSaveAmt = json['you_save_amt'];
    youSavePer = json['you_save_per'];
    otherColorProduct = json['other_color_product'];
    color = json['color'];
    productSize = json['product_size'];
    productQuantity = json['product_quantity'];
    maxUnitBuy = json['max_unit_buy'];
    deliveryCharge = json['delivery_charge'];
    totalViews = json['total_views'];
    totalRate = json['total_rate'];
    rateAvg = json['rate_avg'];
    isFeatured = json['is_featured'];
    todayDeal = json['today_deal'];
    todayDealDate = json['today_deal_date'];
    totalSale = json['total_sale'];
    createdAt = json['created_at'];
    seoTitle = json['seo_title'];
    seoMetaDescription = json['seo_meta_description'];
    seoKeywords = json['seo_keywords'];
    status = json['status'];
    oePartNo = json['oe_part_no'];
    bearingNo = json['bearing_no'];
    modelId = json['model_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['brand_id'] = this.brandId;
    data['offer_id'] = this.offerId;
    data['product_title'] = this.productTitle;
    data['product_slug'] = this.productSlug;
    data['product_desc'] = this.productDesc;
    data['product_features'] = this.productFeatures;
    data['featured_image'] = this.featuredImage;
    data['featured_image2'] = this.featuredImage2;
    data['size_chart'] = this.sizeChart;
    data['product_mrp'] = this.productMrp;
    data['selling_price'] = this.sellingPrice;
    data['you_save_amt'] = this.youSaveAmt;
    data['you_save_per'] = this.youSavePer;
    data['other_color_product'] = this.otherColorProduct;
    data['color'] = this.color;
    data['product_size'] = this.productSize;
    data['product_quantity'] = this.productQuantity;
    data['max_unit_buy'] = this.maxUnitBuy;
    data['delivery_charge'] = this.deliveryCharge;
    data['total_views'] = this.totalViews;
    data['total_rate'] = this.totalRate;
    data['rate_avg'] = this.rateAvg;
    data['is_featured'] = this.isFeatured;
    data['today_deal'] = this.todayDeal;
    data['today_deal_date'] = this.todayDealDate;
    data['total_sale'] = this.totalSale;
    data['created_at'] = this.createdAt;
    data['seo_title'] = this.seoTitle;
    data['seo_meta_description'] = this.seoMetaDescription;
    data['seo_keywords'] = this.seoKeywords;
    data['status'] = this.status;
    data['oe_part_no'] = this.oePartNo;
    data['bearing_no'] = this.bearingNo;
    data['model_id'] = this.modelId;
    return data;
  }
}
