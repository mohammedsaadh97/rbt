// To parse this JSON data, do
//
//     final aboutUsResponse = aboutUsResponseFromJson(jsonString);

import 'dart:convert';

AboutUsResponse aboutUsResponseFromJson(String str) => AboutUsResponse.fromJson(json.decode(str));

String aboutUsResponseToJson(AboutUsResponse data) => json.encode(data.toJson());

class AboutUsResponse {
  bool? status;
  String? message;
  List<AboutUsData>? data;

  AboutUsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory AboutUsResponse.fromJson(Map<String, dynamic> json) => AboutUsResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<AboutUsData>.from(json["data"]!.map((x) => AboutUsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AboutUsData {
  dynamic aboutContent;

  AboutUsData({
    this.aboutContent,
  });

  factory AboutUsData.fromJson(Map<String, dynamic> json) => AboutUsData(
    aboutContent: json["about_content"],
  );

  Map<String, dynamic> toJson() => {
    "about_content": aboutContent,
  };
}
