class Comment {
  String text = '';
  final int CommentId;

  Comment({required this.CommentId, required this.text});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(CommentId: json['id'], text: json['text']);
  }
}

class Story {
  final String title;
  final String url;
  List<int> commentId = [];

  Story({required this.title, required this.url, required this.commentId});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
        title: json['title'],
        url: json['url'] ?? '',
        commentId: json['kids'] == null
            ? List<int>.filled(3, 0)
            : json['kids'].cast<int>());
  }
}
