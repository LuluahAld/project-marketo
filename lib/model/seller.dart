import 'package:project_teamd/model/product.dart';

import 'order.dart';

class Seller {
  final String name;
  final String userName;
  final String email;
  final String about;
  final List<String> review;
  final String id;
  final String logo;
  final String location;
  final String letter;
  final List<Order> order;
  final List<Product> product;
  final String rating;

  const Seller(this.name, this.userName, this.email, this.about, this.review, this.id, this.logo, this.location,
      this.letter, this.order, this.product, this.rating);
}
