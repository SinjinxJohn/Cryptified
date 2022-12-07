import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import './api.dart';

List<Crypto> parsePost(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var posts = list.map((model) => Crypto.fromJson(model)).toList();
  return posts;
}

Future<List<Crypto>> fetchPost() async {
  final response = await http.get(Uri.parse(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"));
  if (response.statusCode == 200) {
    return compute(parsePost, response.body);
  } else {
    throw Exception(" Request api Error");
  }
}
