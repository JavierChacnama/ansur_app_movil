import 'package:ansur_app_movil/models/product_model.dart';
import 'package:ansur_app_movil/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsItem extends StatelessWidget {
  const ProductsItem(this.product, {super.key});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel=context.watch<ProductViewModel>();
    return InkWell(
      child: Card(
        child: Row(
          children: [
            Text(product.title)
          ],
        ),
      ),
    );
  }
}