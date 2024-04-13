import 'dart:typed_data';

import 'package:ansur_app_movil/models/map_model.dart';
import 'package:ansur_app_movil/models/metodo_pago_model.dart';

import 'package:ansur_app_movil/view_models/shopping_data_view_model.dart';
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'widgets/squar_image.dart';

class ShoppingDataScreen extends StatefulWidget {
  const ShoppingDataScreen({super.key});

  @override
  State<ShoppingDataScreen> createState() => _ShoppingDataScreenState();
}

class _ShoppingDataScreenState extends State<ShoppingDataScreen> {

  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    ShoppingDataViewModel shoppingDataViewModel=context.watch<ShoppingDataViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos de compra'),
      ),
      body: _ui(context, shoppingDataViewModel)
    );
  }
  
  _ui(BuildContext context, ShoppingDataViewModel shoppingDataViewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 16,),
            const Align(alignment: Alignment.centerLeft, child: Text('Método de pago')),
            DropdownButton(
              isExpanded: true,
              items: MetodoPagoModel.values
                  .map((paymentMethod) => DropdownMenuItem(
                    value: paymentMethod,
                    child: Text(paymentMethod.name),
                  )).toList(),
              value: shoppingDataViewModel.shoppingData?.paymentMethod ?? MetodoPagoModel.cash,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  shoppingDataViewModel.shoppingData?.paymentMethod = value;
                });
              },
            ),

            TextField(
              maxLength: 50,
              controller: _nameController
                ..text = shoppingDataViewModel.shoppingData?.name ?? '',
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: "Telefono",
              ),
              onChanged: (text) => shoppingDataViewModel.shoppingData?.name = text,
            ),

            TextField(
              maxLength: 15,
              controller: _phoneController
                ..text = shoppingDataViewModel.shoppingData?.phone ?? '',
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: "Telefono",
              ),
              onChanged: (text) => shoppingDataViewModel.shoppingData?.phone = text,
            ),
            TextField(
              maxLength: 200,
              maxLines: 2,
              controller: _addressController
                ..text = shoppingDataViewModel.shoppingData?.address ?? '',
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: "Dirección",
                suffix: InkWell(
                  onTap: () {
                    _goToMap(shoppingDataViewModel);
                  },
                  child: Tab(icon: Image.asset('assets/images/map.png')),
                )
              ),
              onChanged: (text) => shoppingDataViewModel.shoppingData?.address = text,
            ),
            const Align(alignment: Alignment.centerLeft, child: Text('Foto de la fachada')),
            const SizedBox(height: 16,),
            SizedBox(
              width: 250,
              height: 300,
              child: InkWell(
                child: SquarImage(picture: shoppingDataViewModel.picture),
                onTap: () async {
                  await availableCameras().then(
                    (value) => _navigateToCamera(shoppingDataViewModel, value),
                  );
                  
                },
              ),
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
              child: const Text('Comprar'),
              onPressed: () {
                _validateTextField();
              },
            ),
          ],
        ),
      ),
    );
  }

  _goToMap(ShoppingDataViewModel shoppingDataViewModel) async {
    final mapModel = await Navigator.pushNamed(
      context,
      '/map',
      arguments: shoppingDataViewModel.mapModel,
    );
    if (mapModel is MapModel) {
      shoppingDataViewModel.setLocation(mapModel);
    }
  }

  _navigateToCamera(
    ShoppingDataViewModel shoppingDataViewModel,
    List<CameraDescription> cameras,
  ) async {
    // Navigator.of(context).pushNamed('/detail', arguments: );
    Navigator.of(context).pushNamed('/camera');
    final picture = await Navigator.pushNamed(
      context,
      '/camera',
      arguments: cameras,
    );
    if (picture is Uint8List) {
      shoppingDataViewModel.setPicture(picture);
    }
  }

  void _errorMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alerta'),
          content: const Text('Hay campos vacios'),
          actions: <Widget>[
            TextButton(
              child: const Text('Volver a intentar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ir a Inicio'),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ],
        );
      },
    );
  }

    void _succesMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Compra exitosa'),
          content: const Text('Se ha procesado los datos correctamente'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ir a Inicio'),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ],
        );
      },
    );
  }

  void _validateTextField() {
    setState(() {
      if (_nameController.text.isEmpty) {
        _errorMessage(context);
      } else {
        _succesMessage(context);
      }
    });
  }

}
