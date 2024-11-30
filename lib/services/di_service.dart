import 'package:get/get.dart';
import 'package:todoappbloc/controllers/update_controller.dart';

class DiService{
  static Future<void> init() async{
    Get.put<UpdateController>(UpdateController());
    // Get.lazyPut<UpdateController>(() => UpdateController(), fenix: true);

  }
}