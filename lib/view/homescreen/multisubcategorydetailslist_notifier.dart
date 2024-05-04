import 'package:flutter/material.dart';
import 'package:rbt_app/core/base/base_change_notifier.dart';
import 'package:rbt_app/core/data/remote/service/multisubcategorydetailsListRepository.dart';
import 'package:rbt_app/models/request_response/multisubCategory/multisubCategoryResonse.dart';



class MultiSubCategoryDetailsNotifier extends BaseChangeNotifier {
  bool isLoading = false;
  late MultisubcategoryDetailsResponse multisubCategoryDetailsListResponse ;

  List<MultisubcategoryDetailsData> _multisubCategroyDetailsListData = [];

  List<MultisubcategoryDetailsData> get multisubCategroyDetailsListData => _multisubCategroyDetailsListData;

  set multisubCategroyDetailsListData(List<MultisubcategoryDetailsData> value) {
    _multisubCategroyDetailsListData = value;
    notifyListeners();
  }

  List<MultisubcategoryDetailsData> filteredMultiSubCategoryList = [];


  MultiSubCategoryDetailsNotifier(BuildContext context, String id) {
    getMultiSubCategoryDetailsListNotifier(context,id);

  }

  // for sub category list api call
  getMultiSubCategoryDetailsListNotifier(context,id) async {
    await MultiSubCategoryDetailsListRepository().apiMultiSubCategoryDetailsList(id).then((value) {
      multisubCategoryDetailsListResponse = value as MultisubcategoryDetailsResponse;
      if (multisubCategoryDetailsListResponse.data != null) {
        isLoading = true;
        multisubCategroyDetailsListData = multisubCategoryDetailsListResponse.data!;
        filteredMultiSubCategoryList = List.from(multisubCategroyDetailsListData); // Initialize filtered list
      } else {
        print("contentData API error response");
      }
    });
  }

  void filterMultiSubCategories(String query) {
    if (query.isNotEmpty) {
      filteredMultiSubCategoryList = multisubCategroyDetailsListData
          .where((category) =>
          category.multiTwoSubCategoryName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredMultiSubCategoryList = List.from(multisubCategroyDetailsListData);
    }
    notifyListeners();
  }

}
