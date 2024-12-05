import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoappbloc/controllers/update_controller.dart';




class UpdatePage extends StatefulWidget {
  static const String id = "/update_page";
  const UpdatePage({super.key});
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateController>(
        init: UpdateController(),
        builder: (context)=>Scaffold(
      appBar: AppBar(
        title: Text('Edit page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body:
      Container(
        padding:const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller:Get.find<UpdateController>().updateControllerTitle ,
              decoration:const InputDecoration(
                labelText: "titni yangilang",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: Get.find<UpdateController>().updateControllerBody ,
              decoration:const InputDecoration(
                labelText: "bodyni yangilang",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {

                  Get.find<UpdateController>().apiPostEdit(Get.find<UpdateController>().id, Get.find<UpdateController>().updateControllerTitle.text,
                      Get.find<UpdateController>().updateControllerBody.text, Get.find<UpdateController>().userId);
                });
              },
              child: const Text("Yangilash"),
            ),
          ],
        ),
      ),
    ));
  }
}
