import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

const String popularURL = "https://api.thingiverse.com/search/popular/";
const String searchCube = 'https://api.thingiverse.com/search/cube/';
const int perPage = 15;
const int page = 1;
const String bearerTOKEN = "Bearer 316f725a8ccef687443578a1bf6603a0";

class ThingsList {
  List<Hit> hits;
  ThingsList({required this.hits});
  factory ThingsList.fromJson(Map<String, dynamic> json) {

    var hitsJson = json['hits'] as List;
    List<Hit> hitsList = hitsJson.map((e) => Hit.fromJson(e)).toList();

    return ThingsList(
      hits: hitsList
    );
  }
}

class Hit {
  late final String name;
  late final int id;
  late final String image;

  Hit({required this.name, required this.id, required this.image});

  factory Hit.fromJson(Map<String, dynamic> json) {
    return Hit(
      name: json['name'] as String,
      id: json['id'] as int,
      image: json['preview_image'] as String
    );
  }
}

Future <ThingsList> loadThings() async {
  var url = Uri.parse("https://api.thingiverse.com/search/?sort=popular&page=${page}&per_page=${perPage}");
  log('URL' + url.toString());
  var popular = await http.get(url,
      headers: { 'Authorization' : bearerTOKEN });
      return ThingsList.fromJson(json.decode(popular.body));

}

