import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rbt_app/models/request_response/productlist/product_list_Response.dart';
import '../network/app_url.dart';
import '../network/method.dart';
import 'base/base_repository.dart';

class ProductRepository extends BaseRepository {
  ProductRepository._internal();

  static final ProductRepository _singleInstance =
  ProductRepository._internal();

  factory ProductRepository() => _singleInstance;

  //api: content banner
  Future<ProductListResponse?> apiProductList() async {
    Response response = await networkProvider.call(
      method: Method.GET,
      pathUrl: AppUrl.ProductList,
      headers:{
        'Accept': 'application/json',
        //'Authorization': "Bearer ${authtoken}",
      }
    );
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      print("API call sucessful on ProductlistResponse");
      ProductListResponse productListResponse = ProductListResponse.fromJson(jsonDecode(response.data) as Map<String, dynamic>);
      print("API call sucessful after categoryProductResponse");
      print(productListResponse.data);
      return productListResponse;
    } else {
      print("failed API call");
      print(response.statusCode);
    }
  }
}
