import 'package:ansur_app_movil/services/api_product_service.dart';
import 'package:ansur_app_movil/services/i_product_service.dart';
import 'package:ansur_app_movil/view_models/products_view_model.dart';
import 'package:http/http.dart';

class ProductsBuilder {
  static ProductsViewModel builder() {
    IProductService service = APIProductService(Client());
    //ICourseService service = BDCourseService();
    return ProductsViewModel(service);
  }
}