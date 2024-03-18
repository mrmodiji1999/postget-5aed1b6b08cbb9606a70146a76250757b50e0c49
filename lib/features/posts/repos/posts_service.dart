import 'package:dio/dio.dart';
import 'package:postget/features/posts/models/post_data_ui_model.dart';
import 'package:retrofit/retrofit.dart';

part 'posts_service.g.dart';

@RestApi(baseUrl: "https://dummyjson.com")
abstract class PostsService {
  factory PostsService(Dio dio) = _PostsService;

  @GET("/carts")
  Future<dynamic> fetchPosts();
    @POST("/products")
  Future<dynamic> addPost(@Body() Map<String, dynamic> postData);
}
