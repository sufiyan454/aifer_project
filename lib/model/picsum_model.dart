class Pics {
  final String id;
  final String author;
  final String downloadUrl;

  Pics({
    required this.id,
    required this.author,
    required this.downloadUrl,
  });

  factory Pics.fromJson(Map<String, dynamic> json) {
    return Pics(
      id: json["id"].toString(),
      author: json["author"] ?? "",
      downloadUrl: json["download_url"] ?? "",
    );
  }
}