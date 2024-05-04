import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../network/network_provider.dart';

class BaseRepository with ChangeNotifier {
  final networkProvider = NetworkProvider();

  final headerAccept = {
    HttpHeaders.acceptHeader: "application/json",
  };

  final headerContentTypeOctetStream = {
    HttpHeaders.contentTypeHeader: "application/octet-stream",
  };
  final headerContentTypeAndAcceptPayment = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: "application/json",
  };
  final headerContentTypeAndAccept = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: "application/json"
  };
  final headerContentTypeAndAcceptAUS = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: "application/json"
  };
  final headerPDFContentTypeAndAccept = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: "application/json, text/plain, */*",
    HttpHeaders.acceptEncodingHeader: "gzip, deflate, br",
    HttpHeaders.connectionHeader: "keep-alive"
  };
  final Map<String, String> mapAuthHeader = {
    HttpHeaders.authorizationHeader: 'Bearer nhl8gwc8vtee0bookm2vbkw31enngxhj'
  };

  Map<String, String> buildDefaultHeaderWithToken(String token) {
    Map<String, String> header = headerContentTypeAndAccept;
    header.remove(HttpHeaders.authorizationHeader);
    header.putIfAbsent(
        HttpHeaders.authorizationHeader, () => getFormattedToken(token));
    return header;
  }

  Map<String, String> buildDefaultHeaderWithSessionToken(String token) {
    Map<String, String> header = headerContentTypeAndAccept;
    header.remove(HttpHeaders.authorizationHeader);
    header.putIfAbsent(
        HttpHeaders.authorizationHeader, () => getFormattedSessionToken(token));
    return header;
  }

  Map<String, String> buildDefaultPDFHeaderWithToken(String token) {
    Map<String, String> header = headerPDFContentTypeAndAccept;
    header.remove(HttpHeaders.authorizationHeader);
    header.putIfAbsent(
        HttpHeaders.authorizationHeader, () => getFormattedToken(token));
    return header;
  }

  Map<String, String> buildDefaultHeaderWithTokenXML(String token) {
    Map<String, String> header = headerContentTypeAndAccept;
    header.remove(HttpHeaders.authorizationHeader);
    header.putIfAbsent(
        HttpHeaders.authorizationHeader, () => getFormattedToken(token));
    return header;
  }

  String getFormattedToken(String token) {
    return 'Bearer $token';
  }

  String getFormattedSessionToken(String token) {
    return 'X-SESSION $token';
  }
}
