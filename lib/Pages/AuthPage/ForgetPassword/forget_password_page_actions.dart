import 'package:ajo_online/Pages/AuthPage/auth_endpoint.dart';
import 'package:ajo_online/utils/api_helper.dart';

class ForgetPasswordPageAction {

  static Future forgetPassword({loginData}) async {
    return ApiHelper.makePostRequest(url: loginEndpoint, data: loginData, useFormData: true);
  }
}