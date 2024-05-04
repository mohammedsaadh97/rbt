import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rbt_app/models/request_response/multisubCategory/multisubCategoryResonse.dart';
import '../network/app_url.dart';
import '../network/method.dart';
import 'base/base_repository.dart';

class MultiSubCategoryDetailsListRepository extends BaseRepository {
  MultiSubCategoryDetailsListRepository._internal();

  static final MultiSubCategoryDetailsListRepository _singleInstance =
  MultiSubCategoryDetailsListRepository._internal();

  factory MultiSubCategoryDetailsListRepository() => _singleInstance;

  //api: content list multi repo
  Future<MultisubcategoryDetailsResponse?> apiMultiSubCategoryDetailsList(id) async {
    String endpathUrl = "id=${id}";
    Response response = await networkProvider.call(
      method: Method.GET,
      pathUrl: AppUrl.multisubcategoryDetailsList + endpathUrl,
      headers:{
        'Accept': 'application/json',
        //'Authorization': "Bearer ${authtoken}",
      }
    );
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      print("API call sucessful on multi sub category");
    //  ContentResponse contentResponse = contentResponseFromJson(jsonEncode(response.data));
    //  ContentResponse contentResponse = ContentResponse.fromJson(response.data);
     // CategoryListResponse categoryListResponse = categoryListResponseFromJson(jsonEncode(response.data));
      MultisubcategoryDetailsResponse multisubCategoryDetailsListResponse = MultisubcategoryDetailsResponse.fromJson(jsonDecode(response.data) as Map<String, dynamic>);
      print("API call sucessful after mutli sub category");
      print(multisubCategoryDetailsListResponse.data);
      return multisubCategoryDetailsListResponse;
    } else {
      print("failed API call on multi sub category");
      print(response.statusCode);
    }
  }
}
