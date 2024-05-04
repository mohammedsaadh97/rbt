import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rbt_app/models/request_response/subcategory_details/subcategory_details_response.dart';
import '../network/app_url.dart';
import '../network/method.dart';
import 'base/base_repository.dart';

class SubCategoryDetailsListRepository extends BaseRepository {
  SubCategoryDetailsListRepository._internal();

  static final SubCategoryDetailsListRepository _singleInstance =
  SubCategoryDetailsListRepository._internal();

  factory SubCategoryDetailsListRepository() => _singleInstance;

  //api: content banner
  Future<SubcategoryDetailsResponse?> apiSubCategoryDetailsList(id) async {
    String endpathUrl = "id=${id}";
    Response response = await networkProvider.call(
      method: Method.GET,
      pathUrl: AppUrl.subcategoryDetailsList + endpathUrl,
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
      SubcategoryDetailsResponse subCategoryDetailsListResponse = SubcategoryDetailsResponse.fromJson(jsonDecode(response.data) as Map<String, dynamic>);
      print("API call sucessful after sub category");
      print(subCategoryDetailsListResponse.data);
      return subCategoryDetailsListResponse;
    } else {
      print("failed API call");
      print(response.statusCode);
    }
  }
}
