// To parse this JSON data, do
//
//     final contactUsResponse = contactUsResponseFromJson(jsonString);

import 'dart:convert';

ContactUsResponse contactUsResponseFromJson(String str) => ContactUsResponse.fromJson(json.decode(str));

String contactUsResponseToJson(ContactUsResponse data) => json.encode(data.toJson());

class ContactUsResponse {
  bool? status;
  String? message;
  List<ContactUsData>? data;

  ContactUsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ContactUsResponse.fromJson(Map<String, dynamic> json) => ContactUsResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ContactUsData>.from(json["data"]!.map((x) => ContactUsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ContactUsData {
  String? address;
  String? contactNumber;
  String? contactEmail;

  ContactUsData({
    this.address,
    this.contactNumber,
    this.contactEmail,
  });

  factory ContactUsData.fromJson(Map<String, dynamic> json) => ContactUsData(
    address: json["address"],
    contactNumber: json["contact_number"],
    contactEmail: json["contact_email"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "contact_number": contactNumber,
    "contact_email": contactEmail,
  };
}
