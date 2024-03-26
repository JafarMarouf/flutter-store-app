// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.store,
              color: Color.fromARGB(255, 245, 77, 5),
              size: 34,
            ),
            Text(
              ' StoreAPP',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              ' PRO',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Color.fromARGB(255, 245, 77, 5),
              ),
            ),
          ],
        ),
      ),
      body: Text('Add Product Page'),
    );
  }
}
