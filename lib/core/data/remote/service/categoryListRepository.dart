import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rbt_app/models/request_response/categorylist/categorylistResponse.dart';
import '../network/app_url.dart';
import '../network/method.dart';
import 'base/base_repository.dart';

class CategoryListRepository extends BaseRepository {
  CategoryListRepository._internal();

  static final CategoryListRepository _singleInstance =
  CategoryListRepository._internal();

  factory CategoryListRepository() => _singleInstance;

  //api: apiCategoryList
  Future<CategoryListResponse?> apiCategoryList() async {
    Response response = await networkProvider.call(
      method: Method.GET,
      pathUrl: AppUrl.categoryList,
      headers:{
        'Accept': 'application/json',
      }
    );
    if (response.statusCode == HttpStatus.ok) {
      if (kDebugMode) {
        print("API call successful on Category List Repo");
      }
     CategoryListResponse categoryListResponse = CategoryListResponse.fromJson(jsonDecode(response.data) as Map<String, dynamic>);
      print(categoryListResponse.data);
      return categoryListResponse;
    } else {
      if (kDebugMode) {
        print("API call failed on Category List Repo");
        print(response.statusCode);
      }

    }
  }
}
