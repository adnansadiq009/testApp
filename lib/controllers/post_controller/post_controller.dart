import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_media_test/models/dashboard_model/post_model.dart';

class PostController {
  Future<PostsModel?> postData() async {
    const String apiUrl = 'http://95.216.221.251/dev/api/home-posts-test';

    try {
      final response = await http.post(Uri.parse(apiUrl));
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return PostsModel.fromJson(responseData);
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
