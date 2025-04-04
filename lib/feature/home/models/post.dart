class Like {
  final String name;
  final String avatar;

  const Like({required this.name, required this.avatar});
}

class Comment {
  final String name;
  final String content;

  const Comment({required this.name, required this.content});
}

class Post {
  final String name;
  final String avatar;
  final String address;
  final String comment;
  final int totallike;
  final List<String> images;
  final Like like;
  final bool isOfficial;

  const Post({
    required this.name,
    required this.avatar,
    required this.address,
    required this.comment,
    required this.totallike,
    required this.images,
    required this.like,
    this.isOfficial = false,
  });
}
