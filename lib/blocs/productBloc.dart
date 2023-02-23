import 'dart:async';

import 'package:bloc_sample/data/productService.dart';
import 'package:bloc_sample/models/product.dart';

class ProductBloc {
  final StreamController _streamController = StreamController.broadcast();
  Stream get getStream => _streamController.stream;

  List<Product> getAll() {
    _streamController.sink.add(ProductService.getAll());
    return ProductService.getAll();
  }
}

final productBloc = ProductBloc();
