import 'package:ansur_app_movil/models/error_service_model.dart';
import 'package:ansur_app_movil/models/product_model.dart';
import 'package:ansur_app_movil/services/i_product_service.dart';
import 'package:flutter/material.dart';

class ProductsViewModel extends ChangeNotifier{

  bool _loading = false;
  List<ProductModel> _productsListModel = [];
  ErrorServiceModel? _productError;
  ProductModel? _detailProduct;
  final IProductService _productService;

  bool get loading => _loading;
  List<ProductModel> get productsListModel => _productsListModel;
  ErrorServiceModel? get productError => _productError;
  ProductModel? get detailProduct => _detailProduct;
  
  ProductsViewModel(this._productService) {
    getProducts();
  }

  _setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  _setProductsListModel(List<ProductModel> productsListModel) {
    _productsListModel = productsListModel;
  }

  _setProductError(ErrorServiceModel productError) {
    _productError = productError;
  }

  getProducts() async {
    _setLoading(true);
    var response = await _productService.getProducts(null);
    if (response is List<ProductModel>) {
      _setProductsListModel(response);
    } else if (response is ErrorServiceModel) {
      _setProductError(response as ErrorServiceModel);
    }
    _setLoading(false);
  }

    removeProduct(ProductModel? product) async {
    await Future.delayed(const Duration(seconds: 1));
    _productsListModel.remove(product);
    notifyListeners();
  }
}