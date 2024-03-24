import 'package:ansur_app_movil/models/productos.dart';
import 'package:flutter/material.dart';

import 'widgets/squar_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      body: _Body()
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