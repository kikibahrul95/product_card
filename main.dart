# product_card
flutterbasic

/// main.dart///

import 'package:flutter/material.dart';
import 'product_card.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: firstcolor,
        ),
        body: ChangeNotifierProvider<ProductState>(
          builder: (context) => ProductState(),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Consumer<ProductState>(
                builder: (context, productstate, _) => ProductCard(
                  imageURL:
                      "https://cdn2.newsok.biz/cache/large960_blur-d86ec24e3e4e3bdcf4c378b44933b2c7.jpg",
                  name: "Buah Mix 1 Kg",
                  price: "Rp 25.000",
                  quantity: productstate.quantity,
                  notification: ( productstate.quantity >5) ? "Diskon 10%" : null,
                  onAddCartTap: () {},
                  onIncTap: () {
                    productstate.quantity ++;
                  },
                  onDecTap: () {
                    productstate.quantity --;
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState with ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;
  set quantity(int newValue) {
    _quantity = newValue;
    notifyListeners();
  }
}

