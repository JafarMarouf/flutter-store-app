// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/components/custom_card.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/product_page.dart';
// import 'package:store_app/services/get_all_categories_service.dart';
import 'package:store_app/services/get_all_products_service.dart';
// import 'package:store_app/services/get_product_by_category_service.dart';

// import 'package:store_app/services/get_product_by_category_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              )),
        ],
        title: const Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 15,
          right: 15,
          bottom: 10,
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductService().getAllProducts(),
          builder: (context, snapshot) {
            // print(snapshot.error);
            if (snapshot.hasData) {
              List<ProductModel> product = snapshot.data!;
              // print(product);
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisCount: 2,
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 8),
                itemCount: product.length,
                itemBuilder: ((context, index) {
                  return CustomeCard(
                    product: product[index],
                  );
                }),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
