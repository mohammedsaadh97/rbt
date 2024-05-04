import 'package:flutter/material.dart';
import 'package:rbt_app/core/base/base_change_notifier.dart';
import 'package:rbt_app/core/data/remote/service/ProductRepository.dart';
import 'package:rbt_app/core/data/remote/service/categoryListRepository.dart';
import 'package:rbt_app/core/data/remote/service/categoryProductRepository.dart';
import 'package:rbt_app/models/request_response/category_prduct/category_product.dart';
import 'package:rbt_app/models/request_response/categorylist/categorylistResponse.dart';
import 'package:rbt_app/models/request_response/productlist/product_list_Response.dart';


class ProductNotifier extends BaseChangeNotifier {
  bool isLoading = false;

  late ProductListResponse productListResponse;

  List<ProductListData> _productListData = [];

  List<ProductListData> get productListData => _productListData;

  set productListData(List<ProductListData> value) {
    _productListData = value;
    notifyListeners();
  }

  List<ProductListData> filteredProductList = [];

  ProductNotifier(BuildContext context,) {
    getProductListNotifier(context);

  }

// for product list api call
  getProductListNotifier(context) async {
    await ProductRepository().apiProductList().then((value) {
      productListResponse = value as ProductListResponse;
      if (productListResponse.data != null) {
        isLoading = true;
        productListData = productListResponse.data!;
        filteredProductList = List.from(productListData);
        print(productListData);
      } else {
        print("contentData API error response");
      }
    });
  }

  void filterProductList(String query) {
    if (query.isNotEmpty) {
      filteredProductList = productListData
          .where((category) =>
          category.productTitle!.toLowerCase().contains(query.toLowerCase())
              || category.bearingNo!.toLowerCase().contains(query.toLowerCase())
              || category.oePartNo!.toLowerCase().contains(query.toLowerCase())
              || category.sellingPrice!.toLowerCase().contains(query.toLowerCase())
      )
          .toList();
    } else {
      filteredProductList = List.from(productListData);
    }
    notifyListeners();
  }



}
