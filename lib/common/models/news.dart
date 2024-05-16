
class News {
  final String? publishedAt;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;
  final Source? source;

  const News({
    required this.publishedAt,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.source,
  });

  News.fromJson(Map<String, dynamic> json)
      : publishedAt = json['publishedAt'] ?? '',
        title = json['title'] ?? 'Title',
        author = json['author'] ?? '',
        description = json['description'] ?? 'Body',
        url = json['url'] ?? '',
        urlToImage = json['urlToImage'] ?? '',
        content = json['content'] ?? '',
        source = Source.fromJson(json['source']);
}

class Source {
  final String name;

  Source({required this.name});

  Source.fromJson(Map<String, dynamic> json) : name = json['name'] ?? '';
}
