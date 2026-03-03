import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class ApiService {
  static const _endpoint =
      'https://jsonplaceholder.typicode.com/photos?_limit=50';

  static Future<List<Photo>> fetchPhotos() async {
    try {
      final uri = Uri.parse(_endpoint);
      final response = await http.get(uri).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List<dynamic>;
        return data
            .map((e) => Photo.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Server returned ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi gọi API: $e');
    }
  }
}
