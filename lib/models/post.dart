class Post {
  final String title;
  final String text;
  final DateTime time;
  final String username;
  final int id;
  final String url;
  bool? isLiked;

  Post(
      {required this.id,
      required this.time,
      required this.username,
      required this.title,
      required this.text,
      required this.url,
      required this.isLiked});
}
