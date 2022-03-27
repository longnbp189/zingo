import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zingoapp/modules/post/models/post.dart';
import 'package:zingoapp/providers/api_provider.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  static String url = APIProvider().url + '/v1/posts';

  Future<List<Post>?> getPostList() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> heads = <String, String>{};
    heads['Authorization'] = "Bearer " + token!;

    final response = await http.get(Uri.parse(url), headers: heads);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)["data"];
      var result = data.map((json) => Post.fromJson(json)).toList();
      // result.sort(
      // (a, b) => toDate(b.onDateTime!).compareTo(toDate(a.onDateTime!)));
      return result;
    } else {
      throw Exception('Not Found');
    }
  }
}
