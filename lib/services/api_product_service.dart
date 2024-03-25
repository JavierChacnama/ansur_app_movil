import 'dart:convert';

import 'package:ansur_app_movil/models/error_service_model.dart';
import 'package:ansur_app_movil/models/product_model.dart';
import 'package:ansur_app_movil/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:ansur_app_movil/services/i_product_service.dart';
import 'package:ansur_app_movil/services/url_mixin.dart';

class APIProductService with UriMixin implements IProductService{
  final http.Client client;
  final headers = {
    'Content-Type': 'application/json',
  };

  APIProductService(this.client);
  
  @override
  Future<bool> addProduct(Map<String, dynamic> body) async {
    try {
      final url = getUri('product');
      var response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );
      return response.statusCode == 200;
    } catch (exception) {
      throw ErrorServiceModel(kGenericError);
    }
  }
  
  @override
  Future<List<Object>> getProducts(Map<String, dynamic>? queries) async {
    try {
      final url = getUri('product');
      var response = await http.get(url);
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((item) => ProductModel.fromJson(item)).toList();
    } on ArgumentError {
      throw ErrorServiceModel(kParseError);
    } catch (exeption) {
      throw ErrorServiceModel(kGenericError);
    }
  }
  
  @override
  Future<bool> updateProduct(String id, Map<String, dynamic> body) async {
    try {
      final url = getUri('product/$id');
      var response = await http.patch(
        url,
        headers: headers,
        body: json.encode(body),
      );
      return response.statusCode == 200;
    } catch (exception) {
      throw ErrorServiceModel(kGenericError);
    }
  }
}