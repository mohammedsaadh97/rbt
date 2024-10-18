import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rbt_app/core/base/base_change_notifier.dart';
import 'package:rbt_app/core/data/remote/service/aboutusRepository.dart';
import 'package:rbt_app/models/request_response/aboutUs/aboutusResponse.dart';


class AboutUsNotifier extends BaseChangeNotifier {
  bool isLoading = false;
  late AboutUsResponse aboutUsResponse;

  List<AboutUsData> _aboutusListData = [];

  List<AboutUsData> get aboutusListData => _aboutusListData;

  set aboutusListData(List<AboutUsData> value) {
    _aboutusListData = value;
    notifyListeners();
  }


  AboutUsNotifier(BuildContext context) {
    getaboutusListNotifier(context);
  }

  void getaboutusListNotifier(context) async {
    await AboutUsRepository().apiAboutUsList().then((value) {
      aboutUsResponse = value as AboutUsResponse;
      if (aboutUsResponse.data != null) {
        isLoading = true;
        aboutusListData = aboutUsResponse.data!;
      } else {
        if (kDebugMode) {
          print("contentData API error response");
        }
      }
    });
  }

}


