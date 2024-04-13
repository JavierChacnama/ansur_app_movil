

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


class CameraScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraScreen({required this.cameras, super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
} 

class _CameraScreenState extends State<CameraScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Datos de compra'),
      ),
      body: const Center(child: Text('Camara'),)
    );
  }


}