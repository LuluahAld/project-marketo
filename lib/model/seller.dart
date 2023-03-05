import 'package:project_teamd/model/product.dart';

import 'order.dart';

class Seller {
  final String name;
  final String userName;
  final String email;
  final String id;
  final String location;
  final String imageUrl;
  final List<Order> order;
  final List<Product> product;
  final String rating;

  const Seller(this.name, this.userName, this.email, this.id, this.location, this.imageUrl, this.order, this.product,
      this.rating);
}
//Seller (Name, username, email, id, location, image URL, list of order, list of products, Rating) 