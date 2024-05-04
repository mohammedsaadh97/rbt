import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ConnectionProvider {
  Future<bool> checkConnectivity() async {
    if(!kIsWeb){
      try {


        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        } else {
          return false;
        }
      } on SocketException catch (_) {
        return false;
      }
    }else{
      try {
        final result = await http.get(Uri.parse('www.google.com'));
        if(result.statusCode==200){
          return true;
        }
        else{
          return false;
        }
      }
      on SocketException catch (_) {
        return false;
      }
    }


  }
}
