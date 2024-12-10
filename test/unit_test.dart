import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todoappbloc/services/http_service.dart'; // HTTP service
import 'package:todoappbloc/model/post_model.dart';  // Post model

void main() {
  test('should parse the Post data correctly', () {
    final jsonResponse = jsonEncode({
      'id': 1,
      'title': 'Test Title',
      'body': 'Test Body',
    });


    final post = Post.fromJson(jsonDecode(jsonResponse));


    expect(post.id, 1);
    expect(post.title, 'Test Title');
    expect(post.body, 'Test Body');
  });

  test('should fetch data and parse the Post correctly', () async {

    final response = await Network.GET(
      'https://jsonplaceholder.typicode.com/posts/1',
      Network.paramsEmpty(),
    );


    final post = Post.fromJson(jsonDecode(response!));


    expect(post.id, 1);
    expect(post.title, 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit');
    expect(post.body, 'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto');
  });
}
