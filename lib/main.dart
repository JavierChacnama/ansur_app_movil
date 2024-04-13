import 'package:ansur_app_movil/utils/map_builder.dart';
import 'package:ansur_app_movil/utils/products_builder.dart';
import 'package:ansur_app_movil/theme/app_theme.dart';
import 'package:ansur_app_movil/utils/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/shopping_data_builder.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsBuilder.builder()),
        ChangeNotifierProvider(create: (_) => ShoppingDataBuilder.builder()),
        ChangeNotifierProvider(create: (_) => MapBuilder.builder()),
      ],
      child:  MaterialApp(
        title: 'Ansur app',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme(),
        initialRoute: '/',
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}


