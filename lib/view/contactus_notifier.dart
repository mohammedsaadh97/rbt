import 'package:flutter/material.dart';
import 'package:rbt_app/core/base/base_change_notifier.dart';
import 'package:rbt_app/core/data/remote/service/contactusRepository.dart';
import 'package:rbt_app/models/request_response/contact_us/contact_us_Response.dart';



class ContactUsNotifier extends BaseChangeNotifier {
  bool isLoading = false;
  late ContactUsResponse contactUsResponse;
  List<ContactUsData> _contactUsListData = [];

  List<ContactUsData> get contactUsListData => _contactUsListData;

  set contactUsListData(List<ContactUsData> value) {
    _contactUsListData = value;
    notifyListeners();
  }


  ContactUsNotifier(BuildContext context) {
    getContactusListNotifier(context);
  }

  void getContactusListNotifier(context) async {
    await ContactUsRepository().apiContactUsList().then((value) {
      contactUsResponse = value as ContactUsResponse;
      if (contactUsResponse.data != null) {
        isLoading = true;
        contactUsListData = contactUsResponse.data!;
      } else {
        print("contentData API error response");
      }
    });
  }

}


