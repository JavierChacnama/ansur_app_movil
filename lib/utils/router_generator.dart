import 'package:ansur_app_movil/views/home_screen.dart';
import 'package:ansur_app_movil/views/shopping_cart_screen';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/detail':
        // if (arguments is String)
        return MaterialPageRoute(builder: (_) => const ShoppingCartScreen());
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