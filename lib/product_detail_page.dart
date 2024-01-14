import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoestore/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late List sizes;
  late int selectedFilter;

  @override
  void initState() {
    super.initState();
    sizes = widget.product['sizes'] as List;
    selectedFilter = sizes[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffB76E79).withOpacity(0.2),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            widget.product['title'].toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Image.asset(
                widget.product['imageUrl'].toString(),
                width: 300,
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color(0xffB76E79).withOpacity(0.5),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '\$ ${widget.product['price']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFilter = sizes[index];
                              });
                            },
                            child: Chip(
                              label: Text(sizes[index].toString()),
                              padding: const EdgeInsets.all(8),
                              backgroundColor: selectedFilter == sizes[index]
                                  ? const Color(0xffB76E79).withOpacity(0.3)
                                  : Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .addProduct(widget.product);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                        Size(MediaQuery.of(context).size.width * 0.85, 50),
                      ),
                      elevation: const MaterialStatePropertyAll(5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_checkout),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
