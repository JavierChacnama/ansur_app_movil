import 'package:flutter/material.dart';

class SquarImage extends StatelessWidget {
  const SquarImage({
    super.key,
    required this.assets,
    required this.width,
    required this.height,
  });

  final String assets;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEC3138),)
      ),
      child: Image.asset(
        //fit: BoxFit.cover,
        //width: MediaQuery.of(context).size.width,
        width: width,
        height: height,
        assets,
        ),
    );
  }
}