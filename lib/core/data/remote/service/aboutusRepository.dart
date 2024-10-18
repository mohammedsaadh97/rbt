import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
      }
    );
    if (response.statusCode == HttpStatus.ok) {
      if (kDebugMode) {
        print("API call successful on about us");
      }
      AboutUsResponse aboutUsResponse = AboutUsResponse.fromJson(jsonDecode(response.data) as Map<String, dynamic>);
      if (kDebugMode) {
        print(aboutUsResponse.data);
      }
      return aboutUsResponse;
    } else {
      if (kDebugMode) {
        print("API call failed on about us");
        print(response.statusCode);
      }

    }
  }
}
