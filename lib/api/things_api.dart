import 'dart:convert';
import 'dart:developer';

import 'package:thingiverse2/models/top_things_fifteen.dart';
import 'package:thingiverse2/utils/constants.dart';
import 'package:http/http.dart' as http;

class ThingsApi {
  Future<TopThings> getTopList(int perPage) async {
    var params = {
      'sort': 'popular',
      'page': '1',
      'per_page': perPage.toString()};

    var uri = Uri.https(
        Constants.THINGS_BASE_URL, Constants.THINGS_BASE_POPULAR_PATH, params);
    log('request : ${uri.toString()}');

    var request = await http.get(uri,
        headers: {'Authorization': Constants.BEARER_TOKEN});

    log ('status code: ${request.statusCode}');
    return TopThings.fromJson(json.decode(request.body));
  }
}
