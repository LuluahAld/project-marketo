import 'order.dart';

class Users {
  final String name;
  final String userName;
  final String? email;
  final String id;
  final String location;
  final List<Orders> orders;

  const Users({
    required this.name,
    required this.userName,
    required this.email,
    required this.id,
    required this.location,
    required this.orders,
  });

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      id: map['id'],
      name: map['name'],
      userName: map['userName'],
      email: map['email'],
      location: map['location'],
      orders: (map['orders'] as List).map((e) => Orders.fromMap(e)).toList(),
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
    };
  }
}

Users currentUser =
    const Users(name: 'name', userName: 'userName', email: 'email', id: 'id', location: 'location', orders: []);
List<Users> users = [];
