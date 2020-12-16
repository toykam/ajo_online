import 'package:ajo_online/Pages/MosqueFinderPage/MosqueListPage/mosque_list_actions.dart';
import 'package:ajo_online/Pages/MosqueFinderPage/models/mosque.model.dart';
import 'package:ajo_online/utils/base_provider.dart';

class MosqueListProvider extends BaseProvider {
  List<Mosque> mosqueList = [];
  List<Mosque> mosqueListToDsplay = [];
  // String searchParam = '';

  set setMosqueListToDisplay(List<Mosque> mosques) {
    mosqueListToDsplay = mosques;
    print(mosqueListToDsplay);
    notifyListeners();
  }

  void initialize() async {
    try {
      backToLoading(message: 'Loading mosque list...');
      var mosqueResponse = await MosqueListActions.getMosqueList();
      // print('mosques: ${mosqueResponse['data']}');
      mosqueList.clear();
      mosqueList =  mosqueList;
      mosqueResponse['data'].forEach((mos) {
        mosqueList.add(Mosque.fromJson(mos));
      });
      mosqueList.shuffle();
      mosqueList =  mosqueList;
      setMosqueListToDisplay = mosqueList.take(20).toList();
      
      // print('MosqueList: $mosqueList');
      backToLoaded();
    } catch (error) {
      backToFailed(message: '$error');
    }
  }

  void searchMosque({String searchParam}) {
    backToInProgress(message: 'Searching mosque...');
    if (searchParam.isEmpty) {
      mosqueList.shuffle();
      setMosqueListToDisplay = mosqueList.take(20).toList();
      backToLoaded();
    } else {
      // print(searchParam);
      
      setMosqueListToDisplay = mosqueList.where(
        (element) => element.mosqueName.toLowerCase().contains(
          searchParam.toLowerCase()
        )
      ).toList();
      // print(filtered);
      backToLoaded();
    }

  }

  MosqueListProvider() {
    initialize();
  }
}