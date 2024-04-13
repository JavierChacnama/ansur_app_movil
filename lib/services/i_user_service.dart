import 'package:ansur_app_movil/models/shopping_data_model.dart';

abstract class IUserService {
  Future<ShoppingDataModel> getUser();
}
