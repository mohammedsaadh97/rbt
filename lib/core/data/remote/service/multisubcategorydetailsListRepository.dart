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
      }
    );
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      MultisubcategoryDetailsResponse multisubCategoryDetailsListResponse = MultisubcategoryDetailsResponse.fromJson(jsonDecode(response.data) as Map<String, dynamic>);

      return multisubCategoryDetailsListResponse;
    } else {
      print("failed API call on multi sub category");
      print(response.statusCode);
    }
  }
}
