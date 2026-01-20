/// Forum Entity - Domain layer representation
class ForumEntity {
  final String image;
  final String title;
  final String content;
  final int id;
  final String postDate;
  final int answers;
  final int count;

  ForumEntity({
    required this.image,
    required this.title,
    required this.content,
    required this.id,
    required this.postDate,
    required this.answers,
    required this.count,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ForumEntity &&
        other.image == image &&
        other.title == title &&
        other.content == content &&
        other.id == id &&
        other.postDate == postDate &&
        other.answers == answers &&
        other.count == count;
  }

  @override
  int get hashCode {
    return Object.hash(image, title, content, id, postDate, answers, count);
  }

  @override
  String toString() {
    return 'ForumEntity(image: $image, title: $title, content: $content, id: $id, postDate: $postDate, answers: $answers, count: $count)';
  }
}
