import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoestore/cart_provider.dart';
import 'package:shoestore/product_detail_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Map<String, dynamic>> cart =
      Provider.of<CartProvider>(context).cart;

  onRemove(index) {
    Provider.of<CartProvider>(context, listen: false)
        .removeProduct(cart[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffB76E79).withOpacity(0.2),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: cart[index]),
                ));
              });
            },
            title: Text((cart[index]['title']).toString()),
            leading: CircleAvatar(
              backgroundImage: AssetImage((cart[index]['imageUrl']).toString()),
              backgroundColor: Theme.of(context).canvasColor.withOpacity(0.3),
            ),
            subtitle: Text((cart[index]['price']).toString()),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: onRemove(index),
            ),
          );
        },
      ),
    );
  }
}
