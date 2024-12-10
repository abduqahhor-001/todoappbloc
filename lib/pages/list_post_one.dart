import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class ListPostOne extends StatefulWidget {
  final int id;
  ListPostOne(this.id, {Key? key}) : super(key: key);

  @override
  State<ListPostOne> createState() => _ListPostOneState();
}

class _ListPostOneState extends State<ListPostOne> {
  HomeController get homeController => HomeController();

  @override
  void initState() {
    super.initState();
    _fetchPost();

  }
  late Post post ;
  Future<void> _fetchPost() async {
    var response = await Network.GET(
      Network.API_LIST + "/${widget.id}",
      Network.paramsEmpty(),
    );

    if (response != null)  {
      setState(()  {
        post =  Post.fromJson(jsonDecode(response));
      });
    } else {
      LogService.e('Malumot kelmadi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is list one page"),
      ),
      body:  Column(
            children: [
              Text("Post ID: ${post.id}"),
              Text("Post Title: ${post.title}"),
              Text("Post Body: ${post.body}"),
            ],
          ),


    );
  }
}
