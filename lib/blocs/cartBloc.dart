import 'dart:async';

import 'package:bloc_sample/data/cartService.dart';
import 'package:bloc_sample/models/cart.dart';

class CartBloc {
  final StreamController _cartStreamController = StreamController.broadcast();
  Stream get getStream => _cartStreamController.stream;

  void addToChart(Cart item) {
    CartService.addToCart(item);
    //CartService.getCart() bir eventmiş, bu eventi kullanan her widgetin build methodu bir kez daha çalışırmış.
    //haberdar etmek işi yapılırmış.
    _cartStreamController.sink.add(CartService.getCart());
  }

  void removeFromCart(Cart item) {
    CartService.removeFromeCart(item);
    //CartService.getCart() metodunun kullanıldığı her komponenti yeniden yarat ~~~~
    _cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart() {
    return CartService.getCart();
  }
}

final cartBloc = CartBloc();
