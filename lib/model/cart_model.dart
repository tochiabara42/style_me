import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {

  final List _shopItems = [
['Apple', '1.00', 'lib/images/apple.jpg', Colors.red],
['Avocado', '2.00', 'lib/images/avocado.png', Colors.green],
['Banana', '3.00', 'lib/images/banana.png', Colors.yellow],
['Cherries', '3.00', 'lib/images/cherries.png', Colors.pink],
['Grapes', '2.00', 'lib/images/grapes.png', Colors.deepPurple],
['Green Apple', '2.00', 'lib/images/greenapple.png', Colors.green],
['Orange', '3.00', 'lib/images/orange.png', Colors.orange],
['Peach', '2.50', 'lib/images/peach.png', Colors.pink],
['Pear', '1.75', 'lib/images/pear.png', Colors.green],
['Pepper', '3.00', 'lib/images/pepper.png', Colors.orange],
['Guava', '2.00', 'lib/images/pink.png', Colors.pink],
['Strawberries', '3.00', 'lib/images/strawberry.png', Colors.red],
  ];

  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for(int i = 0; i < _cartItems.length; ) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}