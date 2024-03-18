import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:postget/features/posts/models/post_data_ui_model.dart';
import 'package:postget/features/posts/repos/posts_service.dart';

class PostsRepo {
  static Future<List<PostDataUiModel>> fetchPosts() async {
    final dio = Dio();
    final postsService = PostsService(dio);

    try {
      final dynamic responseData = await postsService.fetchPosts();

      if (responseData is List) {
        return responseData.map((data) => PostDataUiModel.fromJson(data)).toList();
      } else if (responseData is Map<String, dynamic>) {
        return [PostDataUiModel.fromJson(responseData)];
      } else {
        log('Unexpected response format: $responseData');
        return [];
      }
    } catch (e) {
      log('Error fetching posts: $e');
      return [];
    }
  }

  static Future<bool> addPost() async {
    final dio = Dio();

    try {
      final headers = {
        'Content-Type': 'application/json',
      };

      final body = {
        "firstName": "narendra",
        "lastName": "jangid",
      };

      final response = await dio.post(
        'https://dummyjson.com/products',
        options: Options(headers: headers),
        data: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error adding post: $e');
      return false;
    }
  }
}
