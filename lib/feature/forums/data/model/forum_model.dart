/// Forum Model - Data layer representation
class ForumModel {
  final String image;
  final String title;
  final String content;
  final int id;
  final String postDate;
  final int answers;
  final int count;

  ForumModel({
    required this.image,
    required this.title,
    required this.content,
    required this.id,
    required this.postDate,
    required this.answers,
    required this.count,
  });

  factory ForumModel.fromJson(Map<String, dynamic> json) {
    return ForumModel(
      image: json['image'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      id: json['ID'] as int? ?? 0,
      postDate: json['post_date'] as String? ?? '',
      answers: json['answers'] as int? ?? 0,
      count: json['count'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'content': content,
      'ID': id,
      'post_date': postDate,
      'answers': answers,
      'count': count,
    };
  }
}
