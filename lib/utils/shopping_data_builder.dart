
import 'package:ansur_app_movil/services/api_user_service.dart';
import 'package:ansur_app_movil/services/i_user_service.dart';
import 'package:ansur_app_movil/view_models/shopping_data_view_model.dart';
import 'package:http/http.dart';


class ShoppingDataBuilder {
    static ShoppingDataViewModel builder() {
      IUserService userService=APIUserService(Client());
    return ShoppingDataViewModel(userService);
  }
}


