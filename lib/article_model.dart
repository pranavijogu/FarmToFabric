class ArticleModel {
  final String title;
  final String subtext;
  final String imageUrl;
  final String url;

  ArticleModel(
      {required this.title,
      required this.subtext,
      required this.imageUrl,
      required this.url});
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        title: json['title'] ?? '',
        subtext: json['description'] ?? '',
        imageUrl: json['ImageUrl'] ?? '',
        url: json['Url'] ?? '');
  }
}
