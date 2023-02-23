import 'package:bloc_sample/blocs/cartBloc.dart';
import 'package:bloc_sample/models/cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: buildCartList(),
    );
  }

  buildCartList() {
    return StreamBuilder(
        initialData: cartBloc.getCart(),
        stream: cartBloc.getStream,
        builder: (context, snapshot) => snapshot.hasData
            ? buildCartListItems(snapshot)
            : const Center(
                child: Text("veri yok"),
              ));
  }

  buildCartListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        final list = snapshot.data;
        return ListTile(
          title: Text(list[index].product.productName),
          subtitle: Text(list[index].product.price.toString()),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              cartBloc.removeFromCart(
                list[index],
              );
            },
          ),
        );
      },
    );
  }
}
