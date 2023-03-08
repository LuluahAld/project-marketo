import 'package:project_teamd/model/product.dart';

class appData {
  static List<Product> cart = [];
  static double total = 0.0;
  static bool cartVisible = false;

  static double calculateTotal() {
    total = 0.0;
    for (var i in cart) {
      total = total + i.price;
    }
    return total;
  }

  static bool visability() {
    if (cart.isEmpty) {
      cartVisible = false;
    } else {
      cartVisible = true;
    }
    return cartVisible;
  }
}
