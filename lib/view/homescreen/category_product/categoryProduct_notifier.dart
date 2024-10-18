import 'package:flutter/material.dart';
import 'package:rbt_app/core/base/base_change_notifier.dart';
import 'package:rbt_app/core/data/remote/service/categoryProductRepository.dart';
import 'package:rbt_app/models/request_response/category_prduct/category_product.dart';


class CategoryProductNotifier extends BaseChangeNotifier {
  bool isLoading = false;


  late CategoryProductResponse categoryProductResponse;

  List<CategoryProductData> _categoryProductData = [];


  List<CategoryProductData> get categoryProductData => _categoryProductData;

  set categoryProductData(List<CategoryProductData> value) {
    _categoryProductData = value;
    notifyListeners();
  }
  List<CategoryProductData> filteredCategoryProductList = [];

  CategoryProductNotifier(BuildContext context,String id,subid,multi_sub_cat_id,multi_two_sub_cat_id) {
    getCategoryProductNotifier(context,id,subid,multi_sub_cat_id,multi_two_sub_cat_id);

  }

// for category list api call
  getCategoryProductNotifier(context,id,subid,multi_sub_cat_id,multi_two_sub_cat_id) async {

    await CategoryProductRepository().apiCategoryProduct(id, subid,multi_sub_cat_id,multi_two_sub_cat_id).then((value) {
      categoryProductResponse = value as CategoryProductResponse;
      if (categoryProductResponse.data != null) {
        isLoading = true;
        categoryProductData = categoryProductResponse.data!;
        filteredCategoryProductList = List.from(categoryProductData);
        print(categoryProductData);
      } else {
        print("API error on get Category Product Notifier");
      }
    });
  }

  void filterSubCategories(String query) {
    if (query.isNotEmpty) {
      filteredCategoryProductList = categoryProductData
          .where((category) =>
          category.productTitle!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredCategoryProductList = List.from(categoryProductData);
    }
    notifyListeners();
  }



}
