import 'package:ajo_online/Pages/AuthPage/LoginPage/login_page_actions.dart';
import 'package:ajo_online/utils/base_provider.dart';
import 'package:flutter/cupertino.dart';

class LoginPageProvider extends BaseProvider {
  String email = '';
  String password = '';
  bool passwordIsVisible = false;

  set setPasswordIsVisible(bool passVisibe) {
    passwordIsVisible = passVisibe;
    notifyListeners();
  }

  // Initialize Default Variables
  void initialize() async {
    backToLoaded();
  }

  void verifyInput(BuildContext context) {
    print('Was clicked');
    if (email.isEmpty && password.isEmpty) {
      backToInfo(message: 'All fields are required');
    } else if (email.isNotEmpty && password.isEmpty) {
      backToInfo(message: 'Password field is required');
    } else if (email.isEmpty && password.isNotEmpty) {
      backToInfo(message: 'Email field is required');
    } else {
      _login(context);
    }
  }

  void _login(BuildContext context) async {
    try {
      backToInProgress(message: 'Login in progress...');
      var loginData = {'email': email, 'password': password};
      var loginResponse = await LoginPageAction.login(loginData: loginData);
      print('LoginResponse: $loginResponse');
      if (loginResponse['status'] == true) {
        backToSuccess(message: loginResponse['msg']);
      } else {
        backToFailed(message: loginResponse['msg']);
      }
    } catch (error) {
      backToFailed(message: '$error');
    }
  }

  LoginPageProvider() {
    initialize();
  }
}