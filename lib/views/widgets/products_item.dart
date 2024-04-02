import 'package:ansur_app_movil/models/product_model.dart';
import 'package:ansur_app_movil/views/widgets/counter_item.dart';
import 'package:flutter/material.dart';

class ProductsItem extends StatelessWidget {
  const ProductsItem(this.product, this.onSelect, {super.key});
  final ProductModel product;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    //ProductViewModel productViewModel=context.watch<ProductViewModel>();
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.shopping_bag),
        ),
        title: Text(product.title),
        subtitle: Text(product.description),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('S/  ${product.price.toString()}'),
            CounterItem(product.stock)
          ],
        ),
      ),
    );
  }
}