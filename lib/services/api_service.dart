import 'package:dio/dio.dart';
import '/models/article_view.dart';



import '../models/article_view.dart';  // Nama proyekmu

class ApiService {
  Dio dio = Dio();

  Future<Welcome?> fetchData() async {
    try {
      var response = await dio.get('https://my-json-server.typicode.com/Fallid/codelab-api/db');
      if (response.statusCode == 200) {
        return Welcome.fromJson(response.data);  // Gunakan model dari 'article_view.dart'
      } else {
        print('Failed to load data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
