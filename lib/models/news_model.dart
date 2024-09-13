// {
// "status": "ok",
// "totalResults": 2056,
// "articles": [
// {
// "source": {
// "id": null,
// "name": "Xataka.com"
// },
// "author": "Rubén Andrés",
// "title": "El deportista que más dinero ha ganado en la historia no es Messi ni Ronaldo: es Cayo Apuleyo Diocles, auriga romano",
// "description": "Figuras del deporte actual como Messi, Cristiano Ronaldo, Rafa Nadal o el mismísimo Fernando Alonso son respetados por sus habilidades en sus respectivas disciplinas deportivas, y patrocinadores y clubes se encargan de recompensarles económicamente en consona…",
// "url": "https://www.xataka.com/magnet/deportista-que-dinero-ha-ganado-historia-no-messi-ronaldo-cayo-apuleyo-diocles-auriga-romano-1",
// "urlToImage": "https://i.blogs.es/fba775/cayo-apuleyo-diocles/840_560.jpeg",
// "publishedAt": "2024-08-20T16:41:00Z",
// "content": "Figuras del deporte actual como Messi, Cristiano Ronaldo, Rafa Nadal o el mismísimo Fernando Alonso son respetados por sus habilidades en sus respectivas disciplinas deportivas, y patrocinadores y cl… [+5095 chars]"
// },


class NewsModels{
  String? status;
  String? message;
  String? totalResults;
  List<Article> articles=[];

  NewsModels(this.status,this.message, this.totalResults, this.articles);
  NewsModels.fromJson(Map<String,dynamic>json){
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

  Article.fromJson(Map<String,dynamic> json){
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

  Source.fromJson(Map<String,dynamic> json){

    id=json["id"];
    name=json["name"];

  }
}