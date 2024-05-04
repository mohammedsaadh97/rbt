import 'package:flutter/material.dart';
import 'package:rbt_app/core/base/base_change_notifier.dart';
import 'package:rbt_app/core/data/remote/service/subcategoryListRepository.dart';
import 'package:rbt_app/models/request_response/subcategory/sub_category_response.dart';


class SubCategoryNotifier extends BaseChangeNotifier {
  bool isLoading = false;
  late SubCategoryListResponse subCategoryListResponse ;

  List<SubCategoryData> _subCategroyListData = [];

  List<SubCategoryData> get subCategroyListData => _subCategroyListData;

  set subCategroyListData(List<SubCategoryData> value) {
    _subCategroyListData = value;
    notifyListeners();
  }

  List<SubCategoryData> filteredSubCategoryList = [];

  SubCategoryNotifier(BuildContext context, String id) {
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
        print("contentData API error response");
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


