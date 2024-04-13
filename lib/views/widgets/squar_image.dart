import 'dart:typed_data';

import 'package:flutter/material.dart';

class SquarImage extends StatelessWidget {
  final Uint8List? picture;
  const SquarImage({
    super.key,
    this.picture
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEC3138),)
      ),
      child: picture == null ? _defaultAvatar() : _imageAvatar(picture!),
    );
  }

  _defaultAvatar() {
    return Image.asset(
      'assets/images/camera.png',
      fit: BoxFit.cover,
    );
  }

  _imageAvatar(Uint8List picture) {
    return Image.memory(picture, fit: BoxFit.cover);
  }

}