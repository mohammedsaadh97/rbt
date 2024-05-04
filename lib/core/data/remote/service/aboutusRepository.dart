import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rbt_app/models/request_response/aboutUs/aboutusResponse.dart';

import '../network/app_url.dart';
import '../network/method.dart';
import 'base/base_repository.dart';

class AboutUsRepository extends BaseRepository {
  AboutUsRepository._internal();

  static final AboutUsRepository _singleInstance =
  AboutUsRepository._internal();

  factory AboutUsRepository() => _singleInstance;

  //api: about us
  Future<AboutUsResponse?> apiAboutUsList() async {
    Response response = await networkProvider.call(
      method: Method.GET,
      pathUrl: AppUrl.aboutUs,
      headers:{
        'Accept': 'application/json',
        //'Authorization': "Bearer ${authtoken}",
      }
    );
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      print("API call sucessful on about us");
      AboutUsResponse aboutUsResponse = AboutUsResponse.fromJson(jsonDecode(response.data) as Map<String, dynamic>);
      print(aboutUsResponse.data);
      return aboutUsResponse;
    } else {
      print("failed API call");
      print(response.statusCode);
    }
  }
}
