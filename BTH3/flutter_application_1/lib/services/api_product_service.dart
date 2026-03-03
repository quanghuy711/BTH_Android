import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import 'product_service.dart';

class ApiProductService {
  static const _endpoint = 'https://fakestoreapi.com/products';

  static Future<List<Product>> fetchProducts() async {
    try {
      // allow manual simulation of error from ProductService
      if (ProductService.simulateError) {
        ProductService.simulateError = false;
        throw Exception('Mô phỏng lỗi kết nối (simulated network error)');
      }

      final uri = Uri.parse(_endpoint);
      final resp = await http.get(uri).timeout(const Duration(seconds: 10));

      if (resp.statusCode != 200) {
        throw Exception('Server returned ${resp.statusCode}');
      }

      final List<dynamic> products = json.decode(resp.body) as List<dynamic>;

      final items = products
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();

      return items;
    } catch (e) {
      throw Exception('Lỗi khi gọi API: $e');
    }
  }
}
