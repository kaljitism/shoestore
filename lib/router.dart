import 'package:flutter/material.dart';
import 'package:shoestore/cart.dart';
import 'package:shoestore/home_page.dart';

class MyRouter extends StatefulWidget {
  const MyRouter({super.key});

  @override
  State<MyRouter> createState() => _MyRouterState();
}

class _MyRouterState extends State<MyRouter> {
  int currentPage = 0;

  List<Widget> pages = const [
    HomePage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            tooltip: 'Cart',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
    );
  }
}
