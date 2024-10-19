import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rbt_app/core/base/base_change_notifier.dart';
import 'package:rbt_app/core/data/remote/service/subcategorydetailsListRepository.dart';
import 'package:rbt_app/models/request_response/subcategory_details/subcategory_details_response.dart';


class SubCategoryFullListNotifier extends BaseChangeNotifier {
  bool isLoading = false;
  late SubcategoryDetailsResponse subCategoryDetailsListResponse ;

  List<SubcategoryDetailsData> _subCategroyDetailsListData = [];

  List<SubcategoryDetailsData> get subCategroyDetailsListData => _subCategroyDetailsListData;


  List<SubcategoryDetailsData> filteredSubCategoryDetailsList = [];

  set subCategroyDetailsListData(List<SubcategoryDetailsData> value) {
    _subCategroyDetailsListData = value;
    notifyListeners();
  }


  SubCategoryFullListNotifier(BuildContext context, String id) {
    getSubCategoryDetailsListNotifier(context,id);

  }

  // for sub category list api call
  getSubCategoryDetailsListNotifier(context,id) async {
    await SubCategoryDetailsListRepository().apiSubCategoryDetailsList(id).then((value) {
      subCategoryDetailsListResponse = value as SubcategoryDetailsResponse;
      if (subCategoryDetailsListResponse.data != null) {
        isLoading = true;
        subCategroyDetailsListData = subCategoryDetailsListResponse.data!;
        filteredSubCategoryDetailsList = List.from(subCategroyDetailsListData); // Initialize filtered list
      } else {
        if (kDebugMode) {
          print("API error on Sub CategoryFullList Notifier");
        }
      }
    });
  }

  void filterSubCategoriesDetails(String query) {
    if (query.isNotEmpty) {
      filteredSubCategoryDetailsList = subCategroyDetailsListData
          .where((category) =>
          category.multiSubCategoryName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredSubCategoryDetailsList = List.from(subCategroyDetailsListData);
    }
    notifyListeners();
  }


}
