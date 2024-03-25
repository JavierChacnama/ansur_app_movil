import 'package:ansur_app_movil/models/productos.dart';
import 'package:ansur_app_movil/view_models/product_view_model.dart';
import 'package:ansur_app_movil/views/products_list.dart';
import 'package:ansur_app_movil/views/shopping_cart_screen';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/squar_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel=context.watch<ProductViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          'Bodega ANSUR Perú'
          ),
        
        centerTitle: false,
      ),
      body: _body2(productViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ShoppingCartScreen(), 
            ),
          );
        },
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}


_body2(ProductViewModel productViewModel) {

    return Column(
      children: [
        const SizedBox(height: 20,),
        Container(
          height: 200,
          color: Colors.cyan,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
                'Lista de productos'
              ),
              Image.asset(
                'assets/images/bodega.png',
                width: 150
              ),
          ],),
        ),
        const SizedBox(height: 20,),
        Expanded(
          child: ProductsList(
            productViewModel.productListModel
          ),
        ),
      ],
    );
  
}

class _Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Container(
          height: 200,
          color: Colors.cyan,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
                'Lista de productos'
              ),
              Image.asset(
                'assets/images/bodega.png',
                width: 150
              ),
          ],),
        ),
        const SizedBox(height: 20,),
        Expanded(
          child: ListView.builder(
            itemCount: productos.length,
            itemBuilder: (BuildContext context, int index) { 
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: SquarAvatar(producto: productos[index].image),
                    title: Text(productos[index].name),
                    subtitle: Text(productos[index].marca+' - '+productos[index].unidad),
                    trailing: Text('S/. ${productos[index].precio}'),
                  )
                ],
              ),
            );
           },),
        ),
      ],
    );
  }
}