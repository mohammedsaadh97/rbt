import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rbt_app/models/request_response/contact_us/contact_us_Response.dart';
import '../network/app_url.dart';
import '../network/method.dart';
import 'base/base_repository.dart';

class ContactUsRepository extends BaseRepository {
  ContactUsRepository._internal();

  static final ContactUsRepository _singleInstance =
  ContactUsRepository._internal();

  factory ContactUsRepository() => _singleInstance;

  //api: contact us
  Future<ContactUsResponse?> apiContactUsList() async {
    Response response = await networkProvider.call(
      method: Method.GET,
      pathUrl: AppUrl.contactUs,
      headers:{
        'Accept': 'application/json',
      }
    );
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      print("API call sucessful on contact us");
      ContactUsResponse contactUsResponse = ContactUsResponse.fromJson(jsonDecode(response.data) as Map<String, dynamic>);
      print(contactUsResponse.data);
      return contactUsResponse;
    } else {
      print("failed API call");
      print(response.statusCode);
    }
  }
}
