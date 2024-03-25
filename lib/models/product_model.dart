import 'package:ansur_app_movil/utils/constants.dart';

class ProductModel{
  String identifier;
  String title;
  String description;
  String price;
  String stock;

  ProductModel({
    required this.identifier,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
  });

    ProductModel.newProduct({
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
  }) : identifier = uuid.v4();

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      identifier: json['id'] as String,
      title: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      stock: json['stock'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': title,
        'description': description,
        'price': price,
        'stock':stock,
      };
}