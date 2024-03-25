abstract class IProductService{
  Future<bool> addProduct(Map<String, dynamic> body);

  Future<List<Object>> getProducts(Map<String, dynamic>? queries);

  Future<bool> updateProduct(String id, Map<String, dynamic> body);
}