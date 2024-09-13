
class SourceResponse {
  String? status;
  String? message;
  List<Sources>? sources;
  SourceResponse({
    this.status,
    this.message,
    this.sources,
}){
    status = status;
    sources = sources;
    message = message;
}

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Sources.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'sources': sources?.map((e) => e.toJson()).toList(),
    };
  }




}



class Sources {
  Sources({
      String? id,
      String? name,
      String? description,
      String? url,
      String? category,
      String? language,
      String? country,}){
    id = id;
    name = name;
    description = description;
    url = url;
    category = category;
    language = language;
    country = country;
}

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'url': url,
      'category': category,
      'language': language,
      'country': country,
    };
  }
  Sources.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;





}