class ForumsEndpoint {
  static const String _baseUrl = '/api/v1';
  
  static String getForumsListing({
    required int pageNumber,
    required int showUsers,
    required String orderBy,
    required String search,
    required String specialities,
  }) {
    return '$_baseUrl/forums/get_listing?page_number=$pageNumber&show_users=$showUsers&orderby=$orderBy&search=$search&specialities=$specialities';
  }

  static const String postAnswer = '$_baseUrl/forums/post_answer';
  static const String getAnswers = '$_baseUrl/forums/get_answers';
}
