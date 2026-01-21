class ForumAnswerRequestModel {
  final int user_id;
  final int forum_id;
  final String forum_answer;

  ForumAnswerRequestModel({
    required this.user_id,
    required this.forum_id,
    required this.forum_answer,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'forum_id': forum_id,
      'forum_answer': forum_answer,
    };
  }
}
