class WishlistResponseModel {
  final bool authentication;
  final String type;
  final String message;

  WishlistResponseModel({
    required this.authentication,
    required this.type,
    required this.message,
  });

  factory WishlistResponseModel.fromJson(Map<String, dynamic> json) {
    return WishlistResponseModel(
      authentication: json['authentication'] ?? false,
      type: json['type'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
