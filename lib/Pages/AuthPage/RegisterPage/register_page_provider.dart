import 'package:ajo_online/Pages/AuthPage/LoginPage/login_page_actions.dart';
import 'package:ajo_online/Pages/AuthPage/RegisterPage/register_page_actions.dart';
import 'package:ajo_online/utils/base_provider.dart';
import 'package:flutter/cupertino.dart';

class RegisterPageProvider extends BaseProvider {
  String email = '';
  String password = '';
  String fullname = '';
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
    if (email.isEmpty && password.isEmpty && fullname.isEmpty) {
      backToInfo(message: 'All fields are required');
    } else if (email.isNotEmpty && password.isEmpty && fullname.isNotEmpty) {
      backToInfo(message: 'Password field is required');
    } else if (email.isEmpty && password.isNotEmpty && fullname.isNotEmpty) {
      backToInfo(message: 'Email field is required');
    }  else if (email.isNotEmpty && password.isNotEmpty && fullname.isEmpty) {
      backToInfo(message: 'Full name field is required');
    } else {
      _login(context);
    }
  }

  void _login(BuildContext context) async {
    try {
      backToInProgress(message: 'Registeration in progress...');
      var registerData = {'email': email, 'password': password};
      var loginResponse = await RegisterPageAction.register(loginData: registerData);
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

  RegisterPageProvider() {
    initialize();
  }
}