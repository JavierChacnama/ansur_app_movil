import 'package:ansur_app_movil/view_models/products_view_model.dart';
import 'package:ansur_app_movil/views/widgets/app_loading.dart';
import 'package:ansur_app_movil/views/widgets/products_header.dart';
import 'package:ansur_app_movil/views/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _navigateToCart(BuildContext context) {
    // Navigator.of(context).pushNamed('/detail', arguments: );
    Navigator.of(context).pushNamed('/carrito');
  }  
  @override
  Widget build(BuildContext context) {
    ProductsViewModel productsViewModel=context.watch<ProductsViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda Ansur Perú'),
      ),
      body: _ui(productsViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _navigateToCart(context);
        },
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }

  _ui(ProductsViewModel productsViewModel) {
    if (productsViewModel.loading) {
      return const AppLoading();
    }

    if (productsViewModel.productError != null) {
      return Container();
    }

    return Column(
      children: [
        const ProductsHeader(),
        Expanded(
          child: ProductsList(
            productsViewModel.productsListModel,
            () {
            },
          ),
        )
      ],
    );
  }  
}
