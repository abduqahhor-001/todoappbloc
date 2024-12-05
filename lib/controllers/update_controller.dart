import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class UpdateController extends GetxController{
  var userId = 1;
  var id = 10;

  final TextEditingController updateControllerTitle = TextEditingController();
  final TextEditingController updateControllerBody = TextEditingController();


  void apiPostEdit(int id, String title, String body, int userId) async {
  update();
    var response = await Network.PUT(
        Network.API_UPDATE + id.toString(),
        Network.paramsUpdate(
            Post(id: id, title: title, body: body, userId: userId)));
    LogService.d(response.toString());
    update();
  }
}