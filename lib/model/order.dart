import 'product.dart';

class Order {
  final String id;
  final String orderStatus;
  final String orderDate;
  final String shopName;
  final String numOfProduct;
  final List<Product> products;

  const Order({
    required this.id,
    required this.orderStatus,
    required this.orderDate,
    required this.shopName,
    required this.numOfProduct,
    required this.products,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      orderStatus: map['orderStatus'],
      orderDate: map['orderDate'],
      shopName: map['shopName'],
      numOfProduct: map['numOfProduct'],
      products: (map['products'] as List).map((e) => Product.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orderStatus': orderStatus,
      'orderDate': orderDate,
      'numOfProduct': numOfProduct,
      'shopName': shopName,
      'products': products.map((e) => e.toMap()).toList(),
    };
  }
}
