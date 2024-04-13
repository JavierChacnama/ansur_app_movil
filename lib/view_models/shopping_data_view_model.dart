import 'dart:convert';
import 'dart:typed_data';

import 'package:ansur_app_movil/models/map_model.dart';
import 'package:ansur_app_movil/models/shopping_data_model.dart';
import 'package:ansur_app_movil/services/i_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShoppingDataViewModel extends ChangeNotifier{
  IUserService userService;


  bool _loading = false;
  List<ShoppingDataModel> _shoppingDataListModel = [];
  Uint8List? _picture;
  ShoppingDataModel? _shoppingData;
  final defaultLocation = const LatLng(-12.0593574, -77.1127197);

  bool get loading => _loading;
  List<ShoppingDataModel> get shoppingDataListModel=> _shoppingDataListModel;
  Uint8List? get picture => _picture;
  ShoppingDataModel? get shoppingData =>_shoppingData;
  MapModel get mapModel => MapModel(
        _shoppingData?.latitude ?? defaultLocation.latitude,
        _shoppingData?.longitude ?? defaultLocation.longitude,
        '',
  );

  ShoppingDataViewModel(this.userService) {
    fetchUser();
  }

  fetchUser() async {
    _setLoading(true);
    _shoppingData = await userService.getUser();
    if (_shoppingData?.photo != null) {
      _picture = base64Decode(_shoppingData!.photo!);
    }
    _setLoading(false);
  }

  setPicture(Uint8List? file) {
    _picture = file;
    notifyListeners();
  }

  setLocation(MapModel mapModel) {
    _shoppingData?.address = mapModel.address;
    _shoppingData?.latitude = mapModel.latitude;
    _shoppingData?.longitude = mapModel.longitude;
    notifyListeners();
  }

  _setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  Future<String> _preparePicture(Uint8List picture) async {
    final pictureCompressed = await FlutterImageCompress.compressWithList(
      picture,
      minHeight: 960,
      minWidth: 540,
      quality: 10,
      rotate: 0,
    );
    return base64Encode(pictureCompressed);
  }

}