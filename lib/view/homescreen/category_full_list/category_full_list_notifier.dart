import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rbt_app/core/base/base_change_notifier.dart';
import 'package:rbt_app/core/data/remote/service/subcategoryListRepository.dart';
import 'package:rbt_app/models/request_response/subcategory/sub_category_response.dart';


class CategoryFullListNotifier extends BaseChangeNotifier {
  bool isLoading = false;
  late SubCategoryListResponse subCategoryListResponse ;

  List<SubCategoryData> _subCategroyListData = [];

  List<SubCategoryData> get subCategroyListData => _subCategroyListData;

  set subCategroyListData(List<SubCategoryData> value) {
    _subCategroyListData = value;
    notifyListeners();
  }

  List<SubCategoryData> filteredSubCategoryList = [];

  CategoryFullListNotifier(BuildContext context, String id) {
    getSubCategoryListNotifier(context, id);
  }

  void getSubCategoryListNotifier(context, id) async {
    await SubCategoryListRepository().apiSubCategoryList(id).then((value) {
      subCategoryListResponse = value as SubCategoryListResponse;
      if (subCategoryListResponse.data != null) {
        isLoading = true;
        subCategroyListData = subCategoryListResponse.data!;
        filteredSubCategoryList = List.from(subCategroyListData); // Initialize filtered list
      } else {
        if (kDebugMode) {
          print("API error on SubCategoryList Notifier");
        }
      }
    });
  }

  void filterSubCategories(String query) {
    if (query.isNotEmpty) {
      filteredSubCategoryList = subCategroyListData
          .where((category) =>
          category.subCategoryName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredSubCategoryList = List.from(subCategroyListData);
    }
    notifyListeners();
  }
}


