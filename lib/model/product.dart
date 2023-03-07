class Product {
  final String id;
  final String name;
  final double price;
  final String brand;
  final String description;
  final String shopName;
  final String category;
  final String country;
  final double rating;
  final String imageUrl;

  const Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.brand,
      required this.description,
      required this.shopName,
      required this.category,
      required this.country,
      required this.rating,
      required this.imageUrl});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'],
        name: map['name'],
        price: double.parse(map['price'].toString()),
        brand: map['brand'],
        description: map['description'],
        shopName: map['shopName'],
        category: map['category'],
        country: map['country'],
        rating: map['rating'],
        imageUrl: map['imageUrl']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'brand': brand,
      'description': description,
      'shopName': shopName,
      'category': category,
      'country': country,
      'rating': rating,
      'imageUrl': imageUrl,
    };
  }
}
