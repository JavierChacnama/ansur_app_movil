import 'dart:convert';

import 'package:ansur_app_movil/models/error_service_model.dart';
import 'package:ansur_app_movil/models/shopping_data_model.dart';
import 'package:ansur_app_movil/services/i_user_service.dart';
import 'package:ansur_app_movil/services/uri_mixin.dart';
import 'package:ansur_app_movil/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIUserService with UriMixin implements IUserService {
  final http.Client client;
  final headers = {
    'Content-Type': 'application/json',
  };

  APIUserService(this.client);

  @override
  Future<ShoppingDataModel> getUser() async {
    try {
      //final url = getUri('user/653c20ac96680964f7286ccb');
      final url = getUri('order/6618e44d10d1f43a1521ee1e');
      var response = await http.get(url);
      final dynamic result = json.decode(response.body);
      return ShoppingDataModel.fromJson(result);
    } catch (exception) {
      throw ErrorServiceModel(kGenericError);
    }
  }

}