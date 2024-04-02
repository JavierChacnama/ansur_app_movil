import 'package:ansur_app_movil/utils/constants.dart';

class ProductModel{
  String identifier;
  String slug;
  String title;
  String description;
  double price;
  int stock;

  ProductModel({
    required this.identifier,
    required this.slug,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
  });

    ProductModel.newProduct({
    required this.slug,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
  }) : identifier = uuid.v4();

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      identifier: json['id'] as String,
      slug: json['slug'] as String,
      title: json['name'] as String,
      description: json['description'] as String,
      price: json['price'].toDouble() as double,
      stock: json['stock']
    );
  }

  Map<String, dynamic> toJson() => {
        'slug': slug,
        'name': title,
        'description': description,
        // 'price': price,
        // 'stock':stock,
      };
}