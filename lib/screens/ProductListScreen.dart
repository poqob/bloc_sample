import 'package:bloc_sample/blocs/cartBloc.dart';
import 'package:bloc_sample/blocs/productBloc.dart';
import 'package:bloc_sample/models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAll(),
      stream: productBloc.getStream,
      builder: (context, snapshot) => snapshot.hasData
          ? buildProductListItem(snapshot)
          : const Center(child: Text("data bekleniyor")),
    );
  }

  buildProductListItem(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        final list = snapshot.data;
        return ListTile(
          title: Text(list[index].productName),
          subtitle: Text(list[index].price.toString()),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              cartBloc.addToChart(
                Cart(list[index], 1),
              );
            },
          ),
        );
      },
    );
  }
}
