import 'package:flutter/material.dart';

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
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'].toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Image.asset(
                widget.product['imageUrl'].toString(),
                width: 300,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffB76E79).withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Column(
                  children: [
                    Text(
                      '\$ ${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sizes.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedFilter = sizes[index];
                                  });
                                },
                                child: Chip(
                                  label: Text(sizes[index].toString()),
                                  padding: const EdgeInsets.all(8),
                                  backgroundColor: selectedFilter ==
                                          sizes[index]
                                      ? const Color(0xffB76E79).withOpacity(0.3)
                                      : Colors.white,
                                ),
                              ),
                              const SizedBox(width: 5),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
