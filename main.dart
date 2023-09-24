import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int totalBought = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              title:Center(
                child: Text('Product List'),
              ),
          ),
          body: ProductList(),
          floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Cartpage()),
            );
    },
      child: Icon(Icons.shopping_cart),
    ),
      ),
    );
  }
}
class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Apple', price: 100),
    Product(name: 'Orange', price: 200),
    Product(name: 'Grapes', price: 300),
    Product(name: 'Watermelon', price: 400),
    Product(name: 'Pineapple', price: 500),
    Product(name: 'Biscuits', price: 600),
    Product(name: 'Chocolate', price: 700),
    Product(name: 'Ice-cream', price: 800),
    Product(name: 'Chips', price: 900),
    Product(name: 'Juice', price: 1000),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index].name),
          subtitle: Text('\৳ ${products[index].price}'),
          trailing: ProductCounter(
            onBuy: () {
              setState(() {
                products[index].buyCount++;
                if (products[index].buyCount == 5) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text('You\'ve bought 5 ${products[index].name}!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
          ),
        );
      },
    );
  }
}

class Product {
  String name;
  double price;
  int buyCount = 0;

  Product({required this.name, required this.price});
}

class ProductCounter extends StatelessWidget {
  final Function() onBuy;

  ProductCounter({required this.onBuy});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Quantity: '),
        TextButton(
          onPressed: onBuy,
          child: Text('Buy Now'),
        ),
      ],
    );
  }
}
class Cartpage extends StatelessWidget {
      Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Cart'),
        ),
    body: Center(
    child: Column(
      children: [
        Text('Total Products 5'),
        ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => MyApp()),
                  (route) => false,
            );
          },
          child: Text('Go to Cart'),
        )
      ],
    )
    ),
    );
    }
}

