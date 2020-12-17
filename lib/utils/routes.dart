import 'package:ajo_online/Pages/AuthPage/ForgetPassword/forget_password_page.dart';
import 'package:ajo_online/Pages/AuthPage/ForgetPassword/forget_password_page_provider.dart';
import 'package:ajo_online/Pages/AuthPage/LoginPage/login_page.dart';
import 'package:ajo_online/Pages/AuthPage/LoginPage/login_page_provider.dart';
import 'package:ajo_online/Pages/AuthPage/RegisterPage/register_page.dart';
import 'package:ajo_online/Pages/AuthPage/RegisterPage/register_page_provider.dart';
import 'package:ajo_online/Pages/AuthPage/SettingsPage/settings_page.dart';
import 'package:ajo_online/Pages/MosqueFinderPage/MosqueListPage/mosque_list_page.dart';
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
      case '/register':
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(child: RegisterPage(), create: (context) => RegisterPageProvider(),)
        );
        break;
      case '/forget_password':
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(child: ForgetPasswordPage(), create: (context) => ForgetPasswordPageProvider(),)
        );
        break;
      case '/mosque_list':
        return MaterialPageRoute(
          builder: (context) => MosqueListPage()
        );
        break;
      case '/settings':
        return MaterialPageRoute(
          builder: (context) => SettingsPage()
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