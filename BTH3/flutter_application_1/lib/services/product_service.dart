import 'dart:async';
import '../models/product.dart';

class ProductService {
  /// When true, the next call to [fetchProducts] will throw to simulate a network error.
  static bool simulateError = false;

  static Future<List<Product>> fetchProducts() async {
    try {
      // simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      if (simulateError) {
        // reset flag after simulating
        simulateError = false;
        throw Exception('Mô phỏng lỗi kết nối (simulated network error)');
      }

      final items = <Product>[
        Product(id: 1, title: 'Nước rửa chén', description: 'Dung tích 500ml'),
        Product(
            id: 2, title: 'Sữa tắm', description: 'Scented body wash 400ml'),
        Product(id: 3, title: 'Dầu gội', description: 'Shampoo 400ml'),
        Product(
            id: 4, title: 'Kem đánh răng', description: 'Mint toothpaste 100g'),
        Product(
            id: 5,
            title: 'Chất tẩy trắng quần áo',
            description: 'Laundry bleach 1L'),
        Product(
            id: 6,
            title: 'Chất tẩy rửa vệ sinh',
            description: 'Toilet cleaner 500ml'),
        Product(
            id: 7, title: 'Nước lau kính', description: 'Glass cleaner 500ml'),
        Product(id: 8, title: 'Nước lau sàn', description: 'Floor cleaner 1L'),
      ];

      return items;
    } catch (e) {
      throw Exception('Lỗi khi gọi dữ liệu: $e');
    }
  }
}
