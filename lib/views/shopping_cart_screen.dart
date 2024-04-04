import 'package:ansur_app_movil/models/productos.dart';
import 'package:ansur_app_movil/view_models/products_view_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {

  _navigateToShoppingData(BuildContext context) {
    // Navigator.of(context).pushNamed('/detail', arguments: );
    Navigator.of(context).pushNamed('/datos-compra');
  }  
  
  @override
  Widget build(BuildContext context) {
    ProductsViewModel productsViewModel=context.watch<ProductsViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de compras'),
      ),
      body: _ui(productsViewModel)
    );
  }

  _ui(ProductsViewModel productsViewModel) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: productos.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(productos[index].name),
                    subtitle: Text(productos[index].marca),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('3u'),
                        Text(productos[index].precio)
                      ],
                    )
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Precio total:', style: TextStyle(fontSize: 18),),
              Text('20', style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          child: const Text('Proceder con la compra'),
          onPressed: () {
            _navigateToShoppingData(context);
          },
        ),
      ],
    );
  }
}