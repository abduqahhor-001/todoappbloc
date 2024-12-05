import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoappbloc/controllers/create_controller.dart';



class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return GetX<CreateController>(
        init: CreateController(),
        builder:(controller)=> Scaffold(
          appBar: AppBar(
            title: Text("Create Page"),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body:  Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                TextField(
                  controller: _controller.controllerId,
                  keyboardType: TextInputType.number,
                  decoration:const InputDecoration(
                    labelText: "id",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _controller.controllerTitle,
                  decoration: const InputDecoration(
                    labelText: "titni yarat",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _controller.controllerBody,
                  decoration: const InputDecoration(
                    labelText: "bodyni yarat",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _controller.controllerUserId,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "userId",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {

                      _controller.apiCreatePost(
                          int.parse(_controller.controllerId.text),
                          _controller.controllerTitle.text,
                          _controller.controllerBody.text,
                          int.parse(_controller.controllerUserId.text));
                    });
                  },
                  child: const Text("yaratish"),
                ),
              ],
            ),
          ),

        ));

  }
}
