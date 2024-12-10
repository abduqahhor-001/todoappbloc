import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoappbloc/controllers/home_controller.dart';
import 'package:todoappbloc/controllers/update_controller.dart';
import 'package:todoappbloc/pages/create_page.dart';
import '../views/item_of_post.dart';

class HomePage extends StatefulWidget {
  static const String id = "/home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomeController());
  final _controllerUpdate = Get.put(UpdateController());


  @override
  void initState() {
    super.initState();
    setState(() {
      _controller.apiPostList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('list'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Obx(()=>Stack(
        children: [
          _controller.loader.value
              ?const Center(child: CircularProgressIndicator()):
          Padding(
              padding:const EdgeInsets.all(10),
              child:  ListView.builder(
                  itemCount:_controller.item.length,
                  itemBuilder: (context, index) {
                    var post = _controller.item[index]!;
                    return itemOfPost(post , _controller ,_controllerUpdate,context);
                  }))
        ],
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(

                context, MaterialPageRoute(
              builder: (context)=>const CreatePage()
            )

            );
          });
        },
        tooltip: 'Increment',
        child:const Icon(Icons.add),
      ),
    );
  }






}
