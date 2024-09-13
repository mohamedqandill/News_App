


class NewsModels{
  String? status;
  String? message;
  String? totalResults;
  List<Article> articles=[];

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'totalResults': totalResults,
      'articles': articles.map((e) => e.toJson()).toList(),
    };
  }

  NewsModels(this.status,this.message, this.totalResults, this.articles);
  NewsModels.fromJson(dynamic json){
    articles=<Article>[];
    status=json["status"];
    message=json["message"];
    totalResults=json["totalResult"];
    for(var article in json["articles"]){
      articles.add(Article.fromJson(article));
    }
    json["articles"].forEach((e) {
      articles.add(Article.fromJson(e));
    });
  }
}

class Article{
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Source? source;

  Article(this.author, this.title, this.description, this.url, this.urlToImage,
      this.publishedAt, this.content, this.source);

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      'source': source?.toJson(),
    };
  }
  Article.fromJson(dynamic json){
    author=json["author"];
    title=json["title"];
    description=json["description"];
    url=json["url"];
    urlToImage=json["urlToImage"];
    publishedAt=json["publishedAt"];
    content=json["content"];

    source=Source.fromJson(json["source"]);



  }
}

class Source{
  String? id;
  String? name;

  Source(this.id, this.name);
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Source.fromJson(dynamic json){

    id=json["id"];
    name=json["name"];

  }
}