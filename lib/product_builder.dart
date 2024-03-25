import 'package:ansur_app_movil/services/api_product_service.dart';
import 'package:ansur_app_movil/services/i_product_service.dart';
import 'package:ansur_app_movil/view_models/product_view_model.dart';
import 'package:http/http.dart';

class ProductBuilder {
  static ProductViewModel builder() {
    IProductService service = APIProductService(Client());
    //ICourseService service = BDCourseService();
    return ProductViewModel(service);
  }
}