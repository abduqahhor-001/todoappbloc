
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import 'package:todoappbloc/controllers/home_controller.dart';
import 'package:todoappbloc/controllers/update_controller.dart';
import 'package:todoappbloc/pages/list_post_one.dart';
import 'package:todoappbloc/pages/update_page.dart';

import '../model/post_model.dart';


Widget itemOfPost(Post post ,HomeController homeController , UpdateController updateController , BuildContext context ) {

  return Container(
    margin:const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(

      border: Border.all(width: 1, color: Colors.black),
      borderRadius: BorderRadius.circular(25),
    ),

    child: Slidable(

      key: ValueKey(post.id),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context)  {

              updateController.id = post.id;
              updateController.userId=post.userId;
              updateController.updateControllerTitle.text = post.title;
              updateController.updateControllerBody.text = post.body;

              Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpdatePage()));

            },
            borderRadius: BorderRadius.circular(25),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Update',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              homeController.delPost(post.id.toString());
            },
            borderRadius: BorderRadius.circular(25),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (context) => ListPostOne(post.id),
          ));
        },
        child: ListTile(

          title: Text(post.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          subtitle: Text(post.body , style: const TextStyle(fontSize: 14)),
          isThreeLine: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      )
    ),
  );
}