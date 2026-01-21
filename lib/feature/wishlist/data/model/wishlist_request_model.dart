class WishlistRequestModel {
  final int user_id;
  final int id;
  final String column;

  WishlistRequestModel({
    required this.user_id,
    required this.id,
    required this.column,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'id': id,
      'column': column,
    };
  }
}
