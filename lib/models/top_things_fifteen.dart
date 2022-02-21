import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class TopThings {
  int? total;
  List<Hits>? hits;

  TopThings({this.total, this.hits});

  TopThings.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['hits'] != null) {
      hits = <Hits>[];
      json['hits'].forEach((v) {
        hits!.add(Hits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    if (hits != null) {
      data['hits'] = hits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hits {
  int? id;
  String? name;
  String? url;
  String? publicUrl;
  String? createdAt;
  String? thumbnail;
  String? previewImage;
  Creator? creator;
  int? commentCount;
  int? makeCount;
  int? likeCount;
  List<Tags>? tags;
  bool? isNsfw;

  Hits(
      {this.id,
        this.name,
        this.url,
        this.publicUrl,
        this.createdAt,
        this.thumbnail,
        this.previewImage,
        this.creator,
        this.commentCount,
        this.makeCount,
        this.likeCount,
        this.tags,
        this.isNsfw});

  Hits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    publicUrl = json['public_url'];
    createdAt = json['created_at'];
    thumbnail = json['thumbnail'];
    previewImage = json['preview_image'];
    creator =
    json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    commentCount = json['comment_count'];
    makeCount = json['make_count'];
    likeCount = json['like_count'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    isNsfw = json['is_nsfw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['public_url'] = publicUrl;
    data['created_at'] = createdAt;
    data['thumbnail'] = thumbnail;
    data['preview_image'] = previewImage;
    data['creator'] = creator!.toJson();
    data['comment_count'] = commentCount;
    data['make_count'] = makeCount;
    data['like_count'] = likeCount;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['is_nsfw'] = isNsfw;
    return data;
  }
}

class Creator {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? url;
  String? publicUrl;
  String? thumbnail;
  int? countOfFollowers;
  int? countOfFollowing;
  int? countOfDesigns;
  bool? acceptsTips;
  bool? isFollowing;
  String? location;
  String? cover;

  Creator(
      {this.id,
        this.name,
        this.firstName,
        this.lastName,
        this.url,
        this.publicUrl,
        this.thumbnail,
        this.countOfFollowers,
        this.countOfFollowing,
        this.countOfDesigns,
        this.acceptsTips,
        this.isFollowing,
        this.location,
        this.cover});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    url = json['url'];
    publicUrl = json['public_url'];
    thumbnail = json['thumbnail'];
    countOfFollowers = json['count_of_followers'];
    countOfFollowing = json['count_of_following'];
    countOfDesigns = json['count_of_designs'];
    acceptsTips = json['accepts_tips'];
    isFollowing = json['is_following'];
    location = json['location'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['url'] = url;
    data['public_url'] = publicUrl;
    data['thumbnail'] = thumbnail;
    data['count_of_followers'] = countOfFollowers;
    data['count_of_following'] = countOfFollowing;
    data['count_of_designs'] = countOfDesigns;
    data['accepts_tips'] = acceptsTips;
    data['is_following'] = isFollowing;
    data['location'] = location;
    data['cover'] = cover;
    return data;
  }
}

class Tags {
  String? name;
  String? tag;
  String? url;
  int? count;
  String? thingsUrl;
  String? absoluteUrl;

  Tags(
      {this.name,
        this.tag,
        this.url,
        this.count,
        this.thingsUrl,
        this.absoluteUrl});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tag = json['tag'];
    url = json['url'];
    count = json['count'];
    thingsUrl = json['things_url'];
    absoluteUrl = json['absolute_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['tag'] = tag;
    data['url'] = url;
    data['count'] = count;
    data['things_url'] = thingsUrl;
    data['absolute_url'] = absoluteUrl;
    return data;
  }
}
Future <TopThings> loadThings() async {
  var url = Uri.parse("https://api.thingiverse.com/search/?sort=popular&page=1&per_page=20");
  log('URL' + url.toString());
  var popular = await http.get(url,
      headers: { 'Authorization' : "Bearer 316f725a8ccef687443578a1bf6603a0" });
  return TopThings.fromJson(json.decode(popular.body));

}
