import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> fetch() async {
    final response = await http
          .get(Uri.parse('https://www.dkriesel.com/feed.php?linkto=current&content=html&mode=blogtng&blog=blog-de'));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return (response.body) as String;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
}

void main(){
      fetch().then((result) {
           if (result is String)
                print(result); //use toString to convert as String
    });  
}
