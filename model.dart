import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> loadPosts() async {
  // ローカル実行でもGitHub Pagesでも、同じURLの仕組みでJSONをHTTP取得する。
  var url = Uri.base.resolve('posts.json');
  var res = await http.get(url);
  if (res.statusCode != 200) throw Exception('読み込み失敗');

  List posts = jsonDecode(utf8.decode(res.bodyBytes));
  return posts;
}
