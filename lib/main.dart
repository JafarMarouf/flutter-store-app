// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:store_app/screens/add_product_page.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/product_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'screens/category_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    CategoryPage(),
    const AddProductPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.grey,
      debugShowCheckedModeBanner: false,
      title: 'This is advanced Store App with fake api',
      // initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        ProductPage.id: (context) => ProductPage(),
      },

      home: Scaffold(
        bottomNavigationBar: Container(
          // color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              backgroundColor: Colors.black45,
              color: Colors.black,
              activeColor: Colors.black,
              // tabActiveBorder: Border.all(width: 5, color: Colors.blue),
              // tabBackgroundColor: Colors.white,
              // padding: EdgeInsets.all(),
              gap: 20,
              onTabChange: (val) => {
                setState(() {
                  currentIndex = val;
                }),
                // print(currentIndex),
              },
              tabs: const [
                GButton(
                  icon: Icons.store,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.category,
                  text: 'category',
                ),
                GButton(
                  icon: Icons.add_card,
                  text: 'add product',
                ),
              ],
            ),
          ),
        ),
        body: screens[currentIndex],
      ),
      // home: ,
    );
  }
}
