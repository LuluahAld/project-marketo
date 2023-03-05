import 'product.dart';

class Order {
  final String id;
  final String orderStatus;
  final List<Product> product;

  const Order(
    this.id,
    this.orderStatus,
    this.product,
  );
}
