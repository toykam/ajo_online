import 'package:ajo_online/Pages/AuthPage/LoginPage/login_page.dart';
import 'package:ajo_online/Pages/AuthPage/LoginPage/login_page_provider.dart';
import 'package:ajo_online/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(child: LoginPage(), create: (context) => LoginPageProvider(),)
        );
        break;
      case '/':
        return MaterialPageRoute(
          builder: (context) => MyHomePage(title: 'My App',)
        );
        break;
    }
  }
}