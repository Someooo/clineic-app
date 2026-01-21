class ForumAnswerResponseModel {
  final String type;
  final String message;

  ForumAnswerResponseModel({
    required this.type,
    required this.message,
  });

  factory ForumAnswerResponseModel.fromJson(Map<String, dynamic> json) {
    return ForumAnswerResponseModel(
      type: json['type'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
