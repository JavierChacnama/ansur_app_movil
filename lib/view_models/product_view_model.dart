import 'package:ansur_app_movil/models/error_service_model.dart';
import 'package:ansur_app_movil/models/product_model.dart';
import 'package:ansur_app_movil/services/i_product_service.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier{

  List<ProductModel> _productListModel = [];
  ErrorServiceModel? _productError;
  final IProductService _productService;

  List<ProductModel> get productListModel => _productListModel;
  ErrorServiceModel? get productError => _productError;

  ProductViewModel(this._productService) {
    getProducts();
  }

  _setProductListModel(List<ProductModel> productListModel) {
    _productListModel = productListModel;
  }

  _setProductError(ErrorServiceModel productError) {
    _productError = productError;
  }

  getProducts() async {
    //_setLoading(true);
    var response = await _productService.getProducts(null);
    if (response is List<ProductModel>) {
      _setProductListModel(response);
    } else if (response is ErrorServiceModel) {
      _setProductError(response as ErrorServiceModel);
    }
    //_setLoading(false);
  }
}