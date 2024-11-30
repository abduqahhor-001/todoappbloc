import 'package:flutter/material.dart';
import 'package:todoappbloc/pages/home_page.dart';
import 'package:todoappbloc/services/di_service.dart';

void main() async{
  await DiService.init();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage()
    );
  }
}

