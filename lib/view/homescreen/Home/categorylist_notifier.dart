import 'package:flutter/material.dart';
import 'package:rbt_app/core/base/base_change_notifier.dart';
import 'package:rbt_app/core/data/remote/service/categoryListRepository.dart';
import 'package:rbt_app/models/request_response/categorylist/categorylistResponse.dart';


class CategoryListNotifier extends BaseChangeNotifier {
  bool isLoading = false;
  late CategoryListResponse categoryListResponse;

  List<CategoryListData> _categorylistdata = [];


  List<CategoryListData> get categorylistdata => _categorylistdata;

  set categorylistdata(List<CategoryListData> value) {
    _categorylistdata = value;
    notifyListeners();
  }

  List<CategoryListData> filteredCategoryList = [];


  CategoryListNotifier(BuildContext context) {
    getCategoryListNotifier(context);

  }

// for category list api call
  void getCategoryListNotifier(context) async {
    await CategoryListRepository().apiCategoryList().then((value) {
      categoryListResponse = value as CategoryListResponse;
      if (categoryListResponse.data != null) {
        isLoading == true;
        categorylistdata = categoryListResponse.data!;
        filteredCategoryList = List.from(categorylistdata); // Initialize filtered list
      } else {
        print("API error on CategoryList Notifier");
      }
    });
  }
  void filterCategories(String query) {
    if (query.isNotEmpty) {
      filteredCategoryList = categorylistdata
          .where((category) =>
          category.categoryName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredCategoryList = List.from(categorylistdata);
    }
    notifyListeners();
  }


}
