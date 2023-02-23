import 'package:bloc_sample/models/product.dart';

//singleton tasarım desenine gore yazılmıştır.
class ProductService {
  static List<Product> products = <Product>[];

  static final ProductService _singleton = ProductService._interval();

  //factory, bellekteki hazır productservisi sunar. yeni ornek yaratmaz.

  factory ProductService() {
    return _singleton;
  }

  ProductService._interval();

  static List<Product> getAll() {
    products.add(Product(1, "monster abra", 159.99));
    products.add(Product(2, "monster şimşek", 199.99));
    products.add(Product(3, "msi", 139.25));
    products.add(Product(4, "hp", 119.00));
    return products;
  }
}
