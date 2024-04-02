import 'package:flutter/material.dart';

class CounterItem extends StatefulWidget {
  final int productStock;
  const CounterItem(this.productStock, {super.key});

  @override
  State<CounterItem> createState() => _CounterItemState();
}

class _CounterItemState extends State<CounterItem> {

  int _cantidadActual = 0;
  final int _minCantidad = 0;  // Valor mínimo


  void _incrementar() {
    setState(() {
      
      if (_cantidadActual < widget.productStock){
        _cantidadActual++;
        if(_cantidadActual == widget.productStock)_mostrarAlertDialog(context);
      }
    });
  }

  void _decrementar() {
    setState(() {
      if (_cantidadActual > _minCantidad) _cantidadActual--;
    });
  }

  void _mostrarAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alerta'),
          content: const Text('Se ha alcanzado el stock máximo del producto.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.5),
        border: Border.all(
          color: const Color(0xFFEC3138),
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            SizedBox(
              height: 24,
              width: 24,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.remove_circle_outline_sharp),
                color:  const Color(0xFFEC3138),
                onPressed: _cantidadActual > _minCantidad ? _decrementar : null
              ),
            ),
          
            SizedBox(width:24, child:  Container(alignment: Alignment.center, child: Text(_cantidadActual.toString()))),
      
            SizedBox(
              height: 24,
              width: 24,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.add_circle_outline_sharp),
                color:  const Color(0xFFEC3138),
                onPressed: _cantidadActual < widget.productStock ? _incrementar : null
              ),
            ),
        ],
      ),
    );
  }
}