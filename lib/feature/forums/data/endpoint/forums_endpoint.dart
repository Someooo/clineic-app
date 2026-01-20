class ForumsEndpoint {
  static const String _baseUrl = 'https://clinic.code-pro.io/api/v1';
  
  static String getForumsListing({
    required int pageNumber,
    required int showUsers,
    required String orderBy,
    required String search,
    required String specialities,
  }) {
    return '$_baseUrl/forums/get_listing?page_number=$pageNumber&show_users=$showUsers&orderby=$orderBy&search=$search&specialities=$specialities';
  }
}
