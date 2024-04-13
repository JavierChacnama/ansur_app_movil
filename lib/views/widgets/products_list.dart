import 'package:ansur_app_movil/models/product_model.dart';
import 'package:ansur_app_movil/view_models/products_view_model.dart';
import 'package:ansur_app_movil/views/widgets/products_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatefulWidget {
  const ProductsList(this.products, this.onSelect, {super.key});

  final List<ProductModel> products;
  final void Function() onSelect;

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    ProductsViewModel productsViewModel=context.watch<ProductsViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: productsViewModel.productsListModel.length,
        itemBuilder: (context, index) => ProductsItem(widget.products[index], widget.onSelect),
      ),
    );
  }
}