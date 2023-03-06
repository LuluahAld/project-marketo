import 'product.dart';

class Order {
  final String id;
  final String orderStatus;
  final String orderDate;
  final String shopName;
  final List<Product> product;

  const Order(
    this.id,
    this.orderStatus,
    this.orderDate,
    this.shopName,
    this.product,
  );
}
