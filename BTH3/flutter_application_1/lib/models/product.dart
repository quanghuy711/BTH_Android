class Product {
  final int id;
  final String title;
  final String? description;
  final num? price;
  final String? image;
  final String? category;

  Product(
      {required this.id,
      required this.title,
      this.description,
      this.price,
      this.image,
      this.category});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] is int
          ? json['id'] as int
          : int.parse(json['id'].toString()),
      title: json['title'] as String,
      description: json['description'] as String?,
      price: json['price'] as num?,
      image: (json['image'] ?? json['thumbnail']) as String?,
      category: json['category'] as String?,
    );
  }
}
