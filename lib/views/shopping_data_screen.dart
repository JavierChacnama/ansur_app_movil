import 'package:ansur_app_movil/view_models/products_view_model.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'widgets/data_text_field.dart';
import 'widgets/squar_image.dart';

class ShoppingDataScreen extends StatefulWidget {
  const ShoppingDataScreen({super.key});

  @override
  State<ShoppingDataScreen> createState() => _ShoppingDataScreenState();
}

class _ShoppingDataScreenState extends State<ShoppingDataScreen> {

  String dropdownValue = 'Opción 1';

  _navigateToCamera(BuildContext context) {
    // Navigator.of(context).pushNamed('/detail', arguments: );
    Navigator.of(context).pushNamed('/camera');
  }

  _navigateToMap(BuildContext context) {
    // Navigator.of(context).pushNamed('/detail', arguments: );
    Navigator.of(context).pushNamed('/map');
  }

  @override
  Widget build(BuildContext context) {
    ProductsViewModel productsViewModel=context.watch<ProductsViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos de compra'),
      ),
      body: _ui(productsViewModel)
    );
  }
  
  _ui(ProductsViewModel productsViewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 16,),
            const Align(alignment: Alignment.centerLeft, child: Text('Método de pago')),
            DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Opción 1', 'Opción 2', 'Opción 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const DataTextField(label: 'Apellidos y nombres',maxLength: 50,),
            const DataTextField(label: 'Telefono',maxLength: 15,),
            TextField(
              maxLength: 200,
              maxLines: 2,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: "Dirección",
                suffix: InkWell(
                  onTap: () {
                    _navigateToMap(context);
                  },
                  child: Tab(icon: Image.asset('assets/images/map.png')),
                )
              ),
            ),
            const Align(alignment: Alignment.centerLeft, child: Text('Foto de la fachada')),
            const SizedBox(height: 16,),
            InkWell(
              child: const SquarImage(
                width: 200,
                height: 200,
                assets: 'assets/images/camera.png'
              ),
              onTap: () {
                _navigateToCamera(context);
              },
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
              child: const Text('Comprar'),
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
