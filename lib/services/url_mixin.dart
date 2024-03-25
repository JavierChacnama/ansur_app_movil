mixin UriMixin{
  Uri getUri(String path,
      [String? query, Map<String, dynamic>? queryParameters]) {
    return Uri(
      scheme: 'https',
      host: 'shop-api-roan.vercel.app',
      path: path,
      query: query,
      queryParameters: queryParameters,
    );
  }
}