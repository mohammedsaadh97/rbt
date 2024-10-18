import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rbt_app/models/request_response/category_prduct/category_product.dart';
import 'package:rbt_app/models/request_response/subcategory/sub_category_response.dart';
import '../network/app_url.dart';
import '../network/method.dart';
import 'base/base_repository.dart';

class CategoryProductRepository extends BaseRepository {
  CategoryProductRepository._internal();

  static final CategoryProductRepository _singleInstance =
  CategoryProductRepository._internal();

  factory CategoryProductRepository() => _singleInstance;

  //api: content banner
  Future<CategoryProductResponse?> apiCategoryProduct(id,subid, multi_sub_cat_id, multi_two_sub_cat_id) async {
    String endpathUrl = "cat_id=${id}&sub_cat_id=${subid}&multi_sub_cat_id=${multi_sub_cat_id}&multi_two_sub_cat_id=${multi_two_sub_cat_id}";
    Response response = await networkProvider.call(
      method: Method.GET,
      pathUrl: AppUrl.categoryProduct + endpathUrl,
      headers:{
        'Accept': 'application/json',
        //'Authorization': "Bearer ${authtoken}",
      }
    );
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      print("API call sucessful on categoryProductResponse");
    //  ContentResponse contentResponse = contentResponseFromJson(jsonEncode(response.data));
    //  ContentResponse contentResponse = ContentResponse.fromJson(response.data);
     // CategoryListResponse categoryListResponse = categoryListResponseFromJson(jsonEncode(response.data));
      CategoryProductResponse categoryProductResponse = CategoryProductResponse.fromJson(jsonDecode(response.data) as Map<String, dynamic>);
      print("API call sucessful after categoryProductResponse");
      print(categoryProductResponse.data);
      return categoryProductResponse;
    } else {
      print("failed API call");
      print(response.statusCode);
    }
  }
}
