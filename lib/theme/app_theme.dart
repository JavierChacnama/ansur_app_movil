import 'package:flutter/material.dart';

class AppTheme{
    ThemeData theme(){
        return ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xFFEDEBEB),
            appBarTheme: const AppBarTheme(
                elevation: 1,
                centerTitle: false,
                backgroundColor: Color(0xFFEC3138),
                titleTextStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold                 
                ),
                iconTheme: IconThemeData(
                  color: Colors.white
                )
            ) //AppBarTheme
        ); //ThemeData
    }
}