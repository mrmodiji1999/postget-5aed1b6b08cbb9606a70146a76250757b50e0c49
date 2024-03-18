// import 'dart:convert';
// import 'dart:developer';

// import 'package:http/http.dart' as http;
// import 'package:postget/features/posts/models/post_data_ui_model.dart';

// class PostsRepo {
//   static Future<List<PostDataUiModel>> fetchPosts() async {
//     var client = http.Client();
//     List<PostDataUiModel> posts = [];
//     try {
//       var response =
//           await client.get(Uri.parse('https://dummyjson.com/products'));

//       dynamic responseData = jsonDecode(response.body);

//       if (responseData is List) {
//         for (int i = 0; i < responseData.length; i++) {
//           PostDataUiModel post =
//               PostDataUiModel.fromJson(responseData[i] as Map<String, dynamic>);
//           posts.add(post);
//         }
//       } else if (responseData is Map<String, dynamic>) {
//         PostDataUiModel post = PostDataUiModel.fromJson(responseData);
//         posts.add(post);
//       }

//       return posts;
//     } catch (e) {
//       log(e.toString());
//       return [];
//     }
//   }

//   static Future<bool> addPost() async {
//     var client = http.Client();

//     try {
//       var headers = {
//         'Content-Type': 'application/json',
//       };

//       var body = jsonEncode({
//         "firstName": "narendra",
//         "lastName": "jangid",
       
//       });

//       var response = await client.post(
//         Uri.parse('https://dummyjson.com/products'),
//         headers: headers,
//         body: body,
//       );
//       print(response.statusCode);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       log(e.toString());
//       return false;
//     }
//   }
// }
