import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://flutterxperts.com/how-to-solve-flutter-web-api-cors-error-with-dart-code/
class CorsMiddleware extends http.BaseClient {
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Access-Control-Allow-Origin'] = '*';
    request.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE';
    request.headers['Access-Control-Allow-Headers'] =
        'Origin, Content-Type, X-Auth-Token';

    print('worked');
    return _inner.send(request);
  }
}

final client = http.Client();

Future<void> fetchData() async {
  final request = http.Request('GET', Uri.parse('https://www.dkriesel.com/feed.php?linkto=current&content=html&mode=blogtng&blog=blog-de'));
  final streamedResponse = await client.send(request);
  final response = await http.Response.fromStream(streamedResponse);

  // Process the response
  print(response.body);
}

void main(){
    fetchData();
}
