import 'package:ajo_online/utils/api_helper.dart';

class MosqueListActions {

  static Future getMosqueList() async {
    return ApiHelper.makeGetRequest(url: 'http://173.212.202.67/minbar/api/app/getAllMosque');
  }
}