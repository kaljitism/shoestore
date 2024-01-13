import 'package:flutter/material.dart';
import 'package:shoestore/global_variables.dart';
import 'package:shoestore/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Bata',
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = filters[index];
                            });
                          },
                          child: Chip(
                            label: Text(filters[index]),
                            padding: const EdgeInsets.all(8),
                            backgroundColor: selectedFilter == filters[index]
                                ? const Color(0xffB76E79).withOpacity(0.4)
                                : Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      title: product['title'].toString(),
                      price: product['price'].toString(),
                      imageUrl: product['imageUrl'].toString(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
