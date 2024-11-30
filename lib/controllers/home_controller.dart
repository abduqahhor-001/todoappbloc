import 'package:get/get.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class HomeController extends GetxController{
  var item = [].obs;
  var loader = false.obs;

  void apiPostList() async {
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {

      loader.value =false;


      item.value = Network.parsePostList(response);
      LogService.d('$item');
    } else {
      item.value = [];
    }
  }

  void delPost(String id) async {
    var response =
    await Network.DEL(Network.API_DELETE + id, Network.paramsEmpty());
    LogService.d(response.toString());
  }

}