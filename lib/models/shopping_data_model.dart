
import 'package:ansur_app_movil/models/metodo_pago_model.dart';

class ShoppingDataModel {
  String identifier;
  MetodoPagoModel paymentMethod;
  String name;
  String phone;
  String address;
  double latitude;
  double longitude;
  String? photo;


  ShoppingDataModel({
    required this.identifier,
    required this.paymentMethod,
    required this.name,
    required this.phone,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.photo,

  });

  factory ShoppingDataModel.fromJson(Map<String, dynamic> json) {
    String stringPaymentMethod = json['paymentMethod'] as String;
    return ShoppingDataModel(
      identifier: json['id'] as String,
      paymentMethod: MetodoPagoModel.byName(stringPaymentMethod),
      name: json['userName'] as String,
      phone: json['userPhone'] as String,
      address: json['userAddress'] as String,
      latitude: json['userLat'].toDouble() as double,
      longitude: json['userLng'].toDouble() as double,
      photo: json['userPhoto'] as String?,
  );
  }

  Map<String, dynamic> toJson() => {
        'paymentMethod': paymentMethod.name,
        'userName': name,
        'userPhone': phone,
        'userAddress': address,
        'userLat': latitude,
        'userLng': longitude,
        'userPhoto': photo,
      };
}