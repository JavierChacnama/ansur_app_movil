import 'package:ansur_app_movil/models/map_model.dart';
import 'package:ansur_app_movil/views/camera_screen.dart';
import 'package:ansur_app_movil/views/home_screen.dart';
import 'package:ansur_app_movil/views/map_screen.dart';
import 'package:ansur_app_movil/views/shopping_cart_screen.dart';
import 'package:ansur_app_movil/views/shopping_data_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/carrito':
        // if (arguments is String)
        return MaterialPageRoute(builder: (_) => const ShoppingCartScreen());
      case '/datos-compra':
        // if (arguments is String)
        return MaterialPageRoute(builder: (_) => const ShoppingDataScreen());
      case '/camera':
        if (arguments is List<CameraDescription>) {
          return MaterialPageRoute(builder: (_) => CameraScreen(cameras: arguments));
        } else {
          return _errorRoute();
        }
      case '/map':
        if (arguments is MapModel) {
          return MaterialPageRoute(
              builder: (_) => MapScreen(mapModel: arguments));
        } else {
          return _errorRoute();
        }
        
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}