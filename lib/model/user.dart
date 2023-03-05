import 'order.dart';

class User {
  final String name;
  final String userName;
  final String email;
  final String id;
  final String location;
  final List<Order> order;

  const User(
    this.name,
    this.userName,
    this.email,
    this.id,
    this.location,
    this.order,
  );
}
