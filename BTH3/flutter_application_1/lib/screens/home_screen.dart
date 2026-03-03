import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import '../services/api_product_service.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  final String studentName;
  final String studentId;

  const HomeScreen({
    Key? key,
    required this.studentName,
    required this.studentId,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  String? _error;
  List<Product> _items = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      // Prefer real API; fallback to local mock if API fails
      final items = await ApiProductService.fetchProducts();
      setState(() {
        _items = items;
        _error = null;
      });
    } catch (e) {
      // If API fails, try the local mock so UI still demonstrates functionality
      try {
        final items = await ProductService.fetchProducts();
        setState(() {
          _items = items;
          _error = null;
        });
        return;
      } catch (_) {}
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TH3 - ${widget.studentName} - ${widget.studentId}'),
        actions: [
          IconButton(
            tooltip: 'Simulate Error',
            icon: const Icon(Icons.wifi_off),
            onPressed: () {
              setState(() {
                ProductService.simulateError = true;
              });
              _fetchData();
            },
          ),
        ],
      ),
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 12),
              Text(_error ?? 'Đã xảy ra lỗi', textAlign: TextAlign.center),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _fetchData,
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.9,
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return ProductCard(product: item);
      },
    );
  }
}
