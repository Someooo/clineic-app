class ForumAnswerModel {
  final String userImage;
  final String userName;
  final String genderTitle;
  final int verifyUser;
  final String liked;
  final String answer;

  ForumAnswerModel({
    required this.userImage,
    required this.userName,
    required this.genderTitle,
    required this.verifyUser,
    required this.liked,
    required this.answer,
  });

  factory ForumAnswerModel.fromJson(Map<String, dynamic> json) {
    return ForumAnswerModel(
      userImage: json['user_image'] ?? '',
      userName: json['user_name'] ?? '',
      genderTitle: json['gender_title'] ?? '',
      verifyUser: json['verifyUser'] ?? 0,
      liked: json['liked'] ?? 'no',
      answer: json['answer'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_image': userImage,
      'user_name': userName,
      'gender_title': genderTitle,
      'verifyUser': verifyUser,
      'liked': liked,
      'answer': answer,
    };
  }
}
