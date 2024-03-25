import 'package:ansur_app_movil/models/product_model.dart';
import 'package:ansur_app_movil/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  const ProductsList(this.products, {super.key});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel=context.watch<ProductViewModel>();
    return Expanded(
      child: ListView.builder(
        itemCount: productViewModel.productListModel.length,
        itemBuilder: (BuildContext context, int index) { 
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.abc_outlined),
                title: Text(products[index].title),
                subtitle: Text(products[index].description),
                trailing: Text('S/. ${products[index].price}'),
              )
            ],
          ),
        );
      },),
    );
  }
}