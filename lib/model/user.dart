import 'order.dart';

class User {
  final String name;
  final String userName;
  final String email;
  final String id;
  final String location;
  final List<Order> order;

  User({
    required this.name,
    required this.userName,
    required this.email,
    required this.id,
    required this.location,
    required this.order,
  });
}
