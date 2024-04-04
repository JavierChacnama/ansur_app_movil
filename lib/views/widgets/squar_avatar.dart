import 'package:flutter/material.dart';

class SquarAvatar extends StatelessWidget {
  const SquarAvatar({
    super.key, required this.image,
  });

final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Image.asset(image),
      ),
    );
  }
}

