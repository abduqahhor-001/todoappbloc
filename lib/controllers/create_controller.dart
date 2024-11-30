
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class CreateController extends GetxController{
  final TextEditingController controllerBody = TextEditingController();
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerId = TextEditingController();
  final TextEditingController controllerUserId = TextEditingController();


  void apiCreatePost (int id, String title, String body, int userId) {
    var response= Network.POST(
        Network.API_CREATE,
        Network.paramsCreate(
            Post(id: id, title: title, body: body, userId: userId)));
    LogService.d(response.toString());
  }

}