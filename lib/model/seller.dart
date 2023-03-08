import 'package:project_teamd/model/product.dart';

import 'order.dart';

class Seller {
  final String name;
  final String userName;
  final String email;
  final String about;
  final List<dynamic> review;
  final String id;
  final String logo;
  final String location;
  final String letter;
  final List<Order> orders;
  final List<Product> product;
  final double rating;

  const Seller({
    required this.name,
    required this.userName,
    required this.email,
    required this.about,
    required this.review,
    required this.id,
    required this.logo,
    required this.location,
    required this.letter,
    required this.orders,
    required this.product,
    required this.rating,
  });
  factory Seller.fromMap(Map<String, dynamic> map) {
    return Seller(
      id: map['id'],
      name: map['name'],
      userName: map['userName'],
      email: map['email'],
      about: map['about'],
      review: map['review'],
      logo: map['logo'],
      location: map['location'],
      letter: map['letter'],
      product: (map['product'] as List).map((e) => Product.fromMap(e)).toList(),
      rating: double.parse(map['rating'].toString()),
      orders: (map['orders'] as List).map((e) => Order.fromMap(e)).toList(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userName': userName,
      'email': email,
      'location': location,
      'orders': orders.map((e) => e.toMap()).toList(),
      'about': about,
      'review': review,
      'logo': logo,
      'letter': letter,
      'product': product.map((e) => e.toMap()).toList(),
      'rating': rating,
    };
  }
}
