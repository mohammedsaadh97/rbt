import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rbt_app/models/request_response/subcategory/sub_category_response.dart';
import '../network/app_url.dart';
import '../network/method.dart';
import 'base/base_repository.dart';

class SubCategoryListRepository extends BaseRepository {
  SubCategoryListRepository._internal();

  static final SubCategoryListRepository _singleInstance =
  SubCategoryListRepository._internal();

  factory SubCategoryListRepository() => _singleInstance;

  //api: content banner
  Future<SubCategoryListResponse?> apiSubCategoryList(id) async {
    String endpathUrl = "id=${id}";
    Response response = await networkProvider.call(
      method: Method.GET,
      pathUrl: AppUrl.subcategoryList + endpathUrl,
      headers:{
        'Accept': 'application/json',
        //'Authorization': "Bearer ${authtoken}",
      }
    );
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      print("API call sucessful on sub category");
    //  ContentResponse contentResponse = contentResponseFromJson(jsonEncode(response.data));
    //  ContentResponse contentResponse = ContentResponse.fromJson(response.data);
     // CategoryListResponse categoryListResponse = categoryListResponseFromJson(jsonEncode(response.data));
      SubCategoryListResponse subCategoryListResponse = SubCategoryListResponse.fromJson(jsonDecode(response.data) as Map<String, dynamic>);
      print("API call sucessful after sub category");
      print(subCategoryListResponse.data);
      return subCategoryListResponse;
    } else {
      print("failed API call");
      print(response.statusCode);
    }
  }
}
