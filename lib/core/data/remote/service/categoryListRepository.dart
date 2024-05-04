import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rbt_app/models/request_response/categorylist/categorylistResponse.dart';
import '../network/app_url.dart';
import '../network/method.dart';
import 'base/base_repository.dart';

class CategoryListRepository extends BaseRepository {
  CategoryListRepository._internal();

  static final CategoryListRepository _singleInstance =
  CategoryListRepository._internal();

  factory CategoryListRepository() => _singleInstance;

  //api: content banner
  Future<CategoryListResponse?> apiCategoryList() async {
    Response response = await networkProvider.call(
      method: Method.GET,
      pathUrl: AppUrl.categoryList,
      headers:{
        'Accept': 'application/json',
        //'Authorization': "Bearer ${authtoken}",
      }
    );
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      print("API call sucessful");
    //  ContentResponse contentResponse = contentResponseFromJson(jsonEncode(response.data));
    //  ContentResponse contentResponse = ContentResponse.fromJson(response.data);
     // CategoryListResponse categoryListResponse = categoryListResponseFromJson(jsonEncode(response.data));
     CategoryListResponse categoryListResponse = CategoryListResponse.fromJson(jsonDecode(response.data) as Map<String, dynamic>);
      print("API call sucessful after");
      print(categoryListResponse.data);
      return categoryListResponse;
    } else {
      print("failed API call");
      print(response.statusCode);
    }
  }
}
